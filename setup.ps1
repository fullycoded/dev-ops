[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;

$env = Get-Content "C:\AzureData\CustomData.bin" -First 1

cd 'c:\tspazuredata\'

& .\$env.bat

refreshenv

start powershell {cd 'c:\tspservicemanager\'; & .\setup.ps1 -integrationsetup $true; Read-Host}




