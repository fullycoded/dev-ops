C:\ProgramData\chocolatey\bin\choco.exe install -y sysinternals

net start server;
net start workstation;

cd 'c:\tspazuredata\'; 
& .\sm-dev.ps1;

$password = "$env:VM_PASSWORD"
$username = "spinnaker"

$command = { cd 'c:\tspazuredata\'; & .\sm-dev.ps1; cd 'c:\tspservicemanager\'; & .\setup.ps1 -integrationsetup $true; }

$tempFile = "c:\temp-setup.ps1"

"$command" | Out-file $tempFile

Write-Host "File is: $tempFile"

psexec -accepteula -i -h -u $username -p $password "powershell -noninteractive -executionpolicy Unrestricted -file $tempFile"
