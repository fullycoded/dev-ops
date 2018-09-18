
iisreset;

cd 'c:\tspazuredata\'; 
& .\sm-dev.ps1;

$password = ConvertTo-SecureString "$env:VM_PASSWORD" -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential("$env:COMPUTERNAME\spinnaker", $password)
$command = { cd 'c:\tspazuredata\'; & .\sm-dev.ps1; 'c:\tspservicemanager\'; & .\setup.ps1 -integrationsetup $true; }
start-process powershell -ArgumentList "{-command invoke-command -scriptblock {$command}}" -Credential $credential -Wait
