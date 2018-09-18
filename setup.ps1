
iisreset;

$password = ConvertTo-SecureString "$env:VM_PASSWORD" -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential("$env:COMPUTERNAME\spinnaker", $password)

start powershell { cd 'c:\tspazuredata\'; & .\sm-dev.ps1; cd 'c:\tspservicemanager\'; & .\setup.ps1 -integrationsetup $true; } -Credential $credential -Wait
