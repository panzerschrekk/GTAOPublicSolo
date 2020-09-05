gta5_path := "D:\Games\Epic Games\GTAV"
^f5::
run, *runas %comspec% /c netsh advfirewall firewall set rule name="Grand Theft Auto V" new action=block,, hide, npPid
run, *runas %comspec% /c netsh advfirewall firewall add rule name="GTAVBlockButton" dir=in action=block profile=any program="%gta5_path%\GTA5.exe",, hide, npPid
run, *runas %comspec% /c netsh advfirewall firewall add rule name="GTAVBlockButton" dir=out action=block profile=any program="%gta5_path%\GTA5.exe",, hide, npPid
return

^f6::
run, *runas %comspec% /c netsh advfirewall firewall set rule name="Grand Theft Auto V" new action=allow,, hide, npPid
run, *runas %comspec% /c netsh advfirewall firewall delete rule name="GTAVBlockButton",, hide, npPid
return

^f12::
run, *runas %comspec% /c netsh advfirewall firewall set rule name="Grand Theft Auto V" new action=block,, hide, npPid
run, *runas %comspec% /c netsh advfirewall firewall add rule name="GTAVBlockButton" dir=in action=block profile=any program="%gta5_path%\GTA5.exe",, hide, npPid
run, *runas %comspec% /c netsh advfirewall firewall add rule name="GTAVBlockButton" dir=out action=block profile=any program="%gta5_path%\GTA5.exe",, hide, npPid
Tooltip Blocking GTA5 for 10 sec..., 0, 0
DllCall("Sleep",UInt,1000)
Tooltip
run, *runas %comspec% /c netsh advfirewall firewall set rule name="Grand Theft Auto V" new action=allow,, hide, npPid
run, *runas %comspec% /c netsh advfirewall firewall delete rule name="GTAVBlockButton",, hide, npPid
return