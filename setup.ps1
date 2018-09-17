[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;

iisreset;

$env = Get-Content "C:\AzureData\CustomData.bin" -First 1
& .\sm-$env.ps1

$password = ConvertTo-SecureString "$env:TSP_SM_LOCAL_PASSWORD" -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential("$env:COMPUTERNAME\spinnaker", $password)

start-process powershell.exe -Credential $credential {cd 'c:\tspazuredata\';& .\sm-$env.ps1;c:\tspservicemanager\';& .\setup.ps1 -integrationsetup $true;}
