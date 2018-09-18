cd 'c:\tspazuredata\'; 
& .\sm-dev.ps1;

$password = ConvertTo-SecureString "$env:VM_PASSWORD" -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential("$env:COMPUTERNAME\spinnaker", $password)

$command = { cd 'c:\tspazuredata\'; & .\sm-dev.ps1; cd 'c:\tspservicemanager\'; & .\setup.ps1 -integrationsetup $true; }

$tempFile = "$env:TEMP\temp-setup.ps1"

"$command; Remove-Item `$PSCommandPath" | Out-file $tempFile

Start-Process powershell.exe -ArgumentList @("-nologo -file `"$tempFile`"") -Wait -Credential $credential
