# 🚀Getting Started
Here are some steps to follow if you are a little bit unsure about how to create a basic .NET application and push the code to Azure DevOps. Enjoy!

If not just navigate to the pipeline to see how you should install CodeQL on your hostad agents. You can also install it directly on the agent with cloud-init. If you want to check how it looks like you can click here!

## Create a .NET 7 web application
```powershell

#To install .NET 7, copy the link -> https://dotnet.microsoft.com/en-us/download/dotnet/7.0

#This command is used to create a new project using a template in .NET.
dotnet new webapp -f net7.0

#Creates a .gitignore for .NET applications.
dotnet new gitignore

#Used to build and run your .NET project.
dotnet run

```
## Connect a local Git repo to an Azure Repos Git repo
```powershell
git init -b main
git remote add origin <clone URL> 
git add -A
git commit -am "initial commit"
git push --set-upstream origin main
```

## Setting up Git to authenticate with GitHub when you have 2-factor authentication enabled with GitHub CLI
I have had some problems authenticating against GitHub with a new email address. What I did was follow the steps below to solve the issue.

1. [How to logout from git in windows](https://medium.com/@devesu/how-to-logout-from-git-in-windows-e17c66fe9ca8)
2. [Install GitHub CLI](https://docs.github.com/en/get-started/getting-started-with-git/caching-your-github-credentials-in-git#platform-windows)


## Sources:
[Configure GitHub Advanced Security for Azure DevOps](https://learn.microsoft.com/en-us/azure/devops/repos/security/configure-github-advanced-security-features?view=azure-devops&tabs=yaml)

[Azure DevOps - Create a new Git repo](https://learn.microsoft.com/en-us/azure/devops/repos/git/creatingrepo?view=azure-devops&tabs=command-line)

[Instructions for setting up git to authenticate with GitHub when you have 2-factor authentication set up](https://gist.github.com/ateucher/4634038875263d10fb4817e5ad3d332f)
