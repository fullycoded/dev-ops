iisreset;

[scriptblock]$block = {
 $environment = Get-Content "C:\AzureData\CustomData.bin" -First 1
 cd 'c:\tspazuredata\'; 
 & .\sm-$environment.ps1; 
 cd 'c:\tspservicemanager\'; 
 & .\setup.ps1 -integrationsetup $true;
};

$password = ConvertTo-SecureString "Pa55w0rd#" -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential("$env:COMPUTERNAME\spinnaker", $password)
Start-Process powershell $block -Credential $credential -Wait
