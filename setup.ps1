$Logfile = "C:\$(gc env:computername).log"

LogWrite [System.Security.Principal.WindowsIdentity]::GetCurrent().Name

iisreset;

$env = Get-Content "C:\AzureData\CustomData.bin" -First 1

cd 'c:\tspazuredata\'

& .\$env.bat

refreshenv

start powershell {[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12; cd 'c:\tspservicemanager\'; & .\setup.ps1 -integrationsetup $true; Read-Host }

Function LogWrite
{
   Param ([string]$logstring)

   Add-content $Logfile -value $logstring
}
