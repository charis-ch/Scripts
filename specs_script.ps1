Start-Transcript \\srvname\sharefolder\$username.txt
write-host "Users of current PC"
write-host "___________________"
net users
write-host "###############################"
write-host "`r`n"
write-host "Logged in user"
write-host "______________"
whoami
write-host "###############################"
write-host "`r`n"
write-host "PC Model"
write-host "________"
wmic  computersystem get model,name,manufacturer
write-host "###############################"
write-host "`r`n"
write-host "Serial number"
write-host "______________"
wmic  bios get serialnumber
write-host "###############################"
write-host "`r`n"
write-host "Monitor specs"
write-host "______________"
gwmi WmiMonitorID -Namespace root\wmi | Select @{n="Model";e={[System.Text.Encoding]::ASCII.GetString($_.UserFriendlyName -ne 00)}}, @{n="Serial Number";e={[System.Text.Encoding]::ASCII.GetString($_.SerialNumberID -ne 00)}} | Format-List
Stop-transcript