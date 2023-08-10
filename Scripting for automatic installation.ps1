# to active external execution
Set-ExecutionPolicy Bypass -Scope Process -Force
# install chocolatey if it's not installed
if (!(Test-Path -Path "$env:ProgramData\Chocolatey")) {
  Invoke-Expression((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}
else{
    Write-Host "Chocolatey already exist !" -ForegroundColor Green
}
# list of softwares want to install
$Packages = 'brave', 'discord', 'steam', 'epicgameslauncher','7zip','ea-app' , 'vscode' , 'spotify' , 'nvidia-geforce-now' , 'vlc'
# execute command 'choco install <software> -y' for each software
# -y : to skip virefication steps
ForEach ($PackageName in $Packages)
{
    choco install $PackageName -y
}

#show list of softwares installed
choco list --localonly

Write-Host "Chocolatey script end" -ForegroundColor Green
Pause