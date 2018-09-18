iisreset;

$environment = Get-Content "C:\AzureData\CustomData.bin" -First 1
cd 'c:\tspazuredata\'
& .\sm-$environment.ps1

[scriptblock]$block = {
 cd 'c:\tspazuredata\'; 
 & .\sm-$environment.ps1; 
 cd 'c:\tspservicemanager\'; 
 & .\setup.ps1 -integrationsetup $true; Read-Host;
};

$password = ConvertTo-SecureString "$env:VM_PASSWORD" -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential("$env:COMPUTERNAME\spinnaker", $password)
start powershell $block.Invoke() -Credential $credential
