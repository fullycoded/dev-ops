C:\ProgramData\chocolatey\bin\choco.exe install -y sysinternals

cd 'c:\tspazuredata\'; 
& .\sm-dev.ps1;

$password = "$env:VM_PASSWORD"
$username = "spinnaker"

$command = { cd 'c:\tspazuredata\'; & .\sm-dev.ps1; cd 'c:\tspservicemanager\'; & .\setup.ps1 -integrationsetup $true; }

$tempFile = "$env:TEMP\temp-setup.ps1"

"$command; Remove-Item `$PSCommandPath" | Out-file $tempFile

psexec -accepteula -i 2 -u $username -p $password powershell.exe $tempFile
