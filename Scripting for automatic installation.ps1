# to active external execution
Set-ExecutionPolicy Bypass -Scope Process -Force
# install chocolatey if not installed
if (!(Test-Path -Path "$env:ProgramData\Chocolatey")) {
  Invoke-Expression((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}
else{
    Write-Host "Chocolatey already exist !" -ForegroundColor Green
}
# list of program want to install
$Packages = 'googlechrome', 'anydesk.install', 'microsoft-teams', 'office365business','foxitreader','winrar'
# execute command 'choco install <Packages> -y' for each program
# -y : its for skip steps for
ForEach ($PackageName in $Packages)
{
    choco install $PackageName -y
}

#All software is installed
choco list --localonly

Write-Host "Chocolatey script finiched" -ForegroundColor Green
Pause