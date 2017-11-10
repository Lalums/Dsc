
$NewserverFQDN = "KENAIRMPFL01.ey.net"
$OldServerFQDN = "KENAIRMEYFL03.mea.ey.net"


$ErrorActionPreference = ‘SilentlyContinue’
$Networkdrives = Get-WmiObject -Class Win32_MappedLogicalDisk | select Name, ProviderName
$Cred1 = $(Get-Credential).GetNetworkCredential()

#Copying the existing network drive information to temp folder
$Networkdrives | out-file -LiteralPath "C:\Users\gunnjo2\Documents\SCS - TA and MS Team\0 - As Is File Server Mirgation\Drive Mapping Scripts\mapdrives.txt" -Append
$new = "$NewserverFQDN".Split('.')
$newServer = $new[0]
$old = "$OldServerFQDN".Split('.')
$oldserver = $old[0]
if($Networkdrives -ne "")
{
       foreach ($Networkdrive in $Networkdrives)

      {
        $newmap = ""
        $split= ""
        $Name = $Networkdrive.Name
        $Location= $Networkdrive.ProviderName
        $split= "$location".Split('\\\\')

       if($split[2] -eq $OldServerFQDN)
        {
          net use $name /delete
          $newmap = $Location -replace $OldServerFQDN,$NewserverFQDN
		  net use $name $newmap /persistent:YES $Cred1.Password /USER:$($Cred1.domain)\$($Cred1.UserName)
          
            #$Net = $(New-Object -ComObject WScript.Network)
            #$Net.MapNetworkDrive($name,$newmap)
            #$Net.objNetwork.EnumNetworkDrives

       }
       if($split[2] -eq $oldserver)
         {
          net use $name /delete
          $newmap = $Location -replace $oldserver,$NewserverFQDN
		  net use $name $newmap /persistent:YES $Cred1.Password /USER:$($Cred1.domain)\$($Cred1.UserName)
          
            #$Net = $(New-Object -ComObject WScript.Network)
            #$Net.MapNetworkDrive($name,$newmap)
            #$Net.objNetwork.EnumNetworkDrives 
          }
          else{ Write-Host "fileserver not match" }

      }  
      taskkill /f /IM explorer.exe

      Start-Sleep -Seconds 5
      explorer.exe                              
      }       	


