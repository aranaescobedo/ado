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

```powershell
git init -b main
git remote add origin <clone URL> 
git add -A
git commit -am "initial commit"
git push --set-upstream origin main
```

## Setting up Git to authenticate with GitHub when you have 2-factor authentication enabled

### Source:
[Configure GitHub Advanced Security for Azure DevOps](https://learn.microsoft.com/en-us/azure/devops/repos/security/configure-github-advanced-security-features?view=azure-devops&tabs=yaml)

[Azure DevOps - Create a new Git repo](https://learn.microsoft.com/en-us/azure/devops/repos/git/creatingrepo?view=azure-devops&tabs=command-line)

[Instructions for setting up git to authenticate with GitHub when you have 2-factor authentication set up](https://gist.github.com/ateucher/4634038875263d10fb4817e5ad3d332f)

[How to logout from git in windows](https://medium.com/@devesu/how-to-logout-from-git-in-windows-e17c66fe9ca8)

[Caching your GitHub credentials in Git](https://docs.github.com/en/get-started/getting-started-with-git/caching-your-github-credentials-in-git#platform-windows)