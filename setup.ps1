[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;

$env = Get-Content "C:\AzureData\CustomData.bin" -First 1

cd 'c:\env\'

& .\$env.bat

refreshenv

cd 'c:\tsp service manager\'

& .\setup.ps1 -integrationsetup $true
