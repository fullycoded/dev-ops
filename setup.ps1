C:\ProgramData\chocolatey\bin\choco.exe install -y sysinternals

net start server;
net start workstation;

$environment = Get-Content "C:\AzureData\CustomData.bin" -First 1

cd 'c:\tspazuredata\'; 
& .\sm-$environment.ps1;

$password = "$env:VM_PASSWORD"
$username = "spinnaker"

$command = { cd 'c:\tspservicemanager\'; & .\setup.ps1 -integrationsetup $true; }

$tempFile = "c:\bootstrap.ps1"

"cd 'c:\tspazuredata\'; & .\sm-$environment.ps1; $command" | Out-file $tempFile

psexec -accepteula -h -u $username -p $password cmd /c "echo . | powershell -executionpolicy bypass -file $tempFile"
