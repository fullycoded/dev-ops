iisreset;

$env = Get-Content "C:\AzureData\CustomData.bin" -First 1
cd 'c:\tspazuredata\'
& .\sm-$env.ps1

$password = ConvertTo-SecureString "$env:TSP_SM_LOCAL_PASSWORD" -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential("$env:COMPUTERNAME\spinnaker", $password)
$command = { cd 'c:\tspazuredata\'; & .\sm-$env.ps1; 'c:\tspservicemanager\'; & .\setup.ps1 -integrationsetup $true; }

start-process powershell -ArgumentList "{-command invoke-command -scriptblock {$command}}" -Credential $credential
