C:\ProgramData\chocolatey\bin\choco.exe install -y sysinternals

net start server;
net start workstation;

$environment = Get-Content "C:\AzureData\CustomData.bin" -First 1

cd 'c:\tspazuredata\'; 
& .\ies-$environment.ps1;

$password = "$env:VM_PASSWORD"
$username = "spinnaker"

$command = { cd 'c:\tspies\'; & .\setup.ps1 -integrationSetup $true; }

$tempFile = "c:\bootstrap.ps1"

"cd 'c:\tspazuredata\'; & .\ies-$environment.ps1; $command" | Out-file $tempFile

psexec -accepteula -h -u $username -p $password cmd /c "echo . | powershell -executionpolicy bypass -file $tempFile"
