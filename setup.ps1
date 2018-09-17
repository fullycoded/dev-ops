[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;

iisreset;

$env = Get-Content "C:\AzureData\CustomData.bin" -First 1

cd 'c:\tspazuredata\'

& .\sm-$env.ps1

cd 'c:\tspservicemanager\';

& .\setup.ps1 -integrationsetup $true;
