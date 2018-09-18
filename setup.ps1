
iisreset;

$env = Get-Content "C:\AzureData\CustomData.bin" -First 1

cd 'c:\tspazuredata\'

& .\sm-dev.ps1

refreshenv

start powershell { cd 'c:\tspazuredata\'; & .\sm-dev.ps1; cd 'c:\tspservicemanager\'; & .\setup.ps1 -integrationsetup $true; } -Wait
