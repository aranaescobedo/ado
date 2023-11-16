<p align="center">
 <img width="100px" src="images/azure-devops.svg" align="center" alt="Azure Application Gateway" />
 <h2 align="center">Azure DevOps (ADO)</h2>
 <p align="center">The repository is designed to store and organize scripts, and other resources used for working with Azure DevOps!</p>
</p>

## Prerequisites

- [A valid Azure account][azure-account]
- [Azure CLI][azure-cli]

## File Descriptions

- **[ghasado-webapp-dotnet]**: A NET 7 web app comes with a CodeQL installation pipeline, enabling GitHub Advanced Security on self-hosted Linux agents in Azure DevOps.
  
- **[create-vmss.ps1]**: The script creates a VM scale set and subnet for Azure DevOps agents, enabling Azure AD SSH login and providing steps to install the necessary extensions and connect to the VM instances.

## Usage
Each file in this folder is designed to perform a specific task with ADO or provide troubleshooting information. Before running a file or using any of the provided information, make sure to replace any placeholders enclosed within ```'<>'``` with your own information and follow the instructions carefully.

## Disclaimer
Please note that this is provided as-is and may not suit all use cases. Use at your own discretion and make sure to thoroughly test before deployment in a production environment.

[azure-account]: https://azure.microsoft.com/en-us/free
[azure-cli]: https://docs.microsoft.com/en-us/cli/azure
[create-vmss.ps1]:scripts/create-vmss/create-vmss.ps1
[ghasado-webapp-dotnet]:ghasado-webapp-dotnet
