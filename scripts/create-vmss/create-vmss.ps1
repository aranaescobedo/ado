<#
    .DESCRIPTION
        This script will create a VM scale set and subnet to be used as Azure DevOps agents.
        AADSSHLoginForLinux is enabled, allowing you to log into the VM instance with Azure AD.
        Ensure that the user has one of the roles mentioned below to utilize the extension 
        
        - Virtual Machine Administrator Login: Users who have this role assigned can log in to an Azure virtual machine with administrator privileges.
        - Virtual Machine User Login: Users who have this role assigned can log in to an Azure virtual machine with regular user privileges.
        
        Steps:
        Attention: You may need to run 'az logout' and 'az login' to ensure that you have the latest permissions.
        1. Install extension on your local machine -> az extension add --name ssh
        2. az ssh vm --ip <IP>
        
        Source:
        https://learn.microsoft.com/en-us/azure/active-directory/devices/howto-vm-sign-in-azure-ad-linux#connect-to-vms-in-virtual-machine-scale-sets
        https://learn.microsoft.com/en-us/azure/active-directory/devices/howto-vm-sign-in-azure-ad-linux
        https://ubuntu.com/server/docs/find-ubuntu-images-on-azure

    .NOTES
        AUTHOR: Alexander Arana E
        LASTEDIT: June 05, 2023
#>

param(
    [Parameter(Mandatory = $true)]
    [string]
    [ValidateSet("test", "dev", "prod")]
    $env,
    [Parameter(Mandatory = $true)]
    [String]
    $subnetAddressPrefix
)

$getRootDir = git rev-parse --show-toplevel
Set-Location "$getRootDir\<FILE_PATH>" #The placeholder <FILE_PATH> represents the file path or directory where the script is located within your Git repository.

$appregistrationName = ""
$extensionName = "AADSSHLoginForLinux"
$resouceGroupName = ""
$routeTableName = ""
$subnetName = ""
$subscriptionName = ""
$vmScaleName = ""
$vnetName = ""

"[*] Set environment:"
az account set --subscription $subscriptionName

"[*] Create subnet $subnetName with IP: $subnetAddressPrefix"
az network vnet subnet create `
--address-prefixes $subnetAddressPrefix `
--name $subnetName `
--resource-group $resouceGroupName `
--route-table $routeTableName `
--vnet-name $vnetName

"[*] Create VM scale set"
az vmss create `
--admin-username azureuser `
--assign-identity `
--custom-data cloud-init.txt `
--disable-overprovision `
--ephemeral-os-disk true `
--generate-ssh-keys `
--image Canonical:0001-com-ubuntu-server-jammy:22_04-lts:latest `
--instance-count 1 `
--load-balancer '""' `
--name $vmScaleName `
--nsg '""' `
--os-disk-caching readonly `
--os-disk-size-gb 30 `
--platform-fault-domain-count 1 `
--public-ip-address '""' `
--resource-group $resouceGroupName `
--single-placement-group false `
--subnet $subnetName `
--upgrade-policy-mode manual `
--vm-sku Standard_D4s_v3 `
--vnet-name $vnetName

"[*] Install extension $extensionName"
az vmss extension set `
--name $extensionName `
--publisher Microsoft.Azure.ActiveDirectory `
--resource-group $resouceGroupName `
--vmss-name $vmScaleName

"[*] Give ar-vmss Virtual Machine Contributor permission"
$vmssId = az vmss show `
--name  $vmScaleName `
--resource-group $resouceGroupName   `
--query "id" -o tsv

$objectId = az ad sp list --display-name $appregistrationName --query "[].id" -o tsv
az role assignment create `
--assignee $objectId `
--role "Virtual Machine Contributor" `
--scope $vmssId
