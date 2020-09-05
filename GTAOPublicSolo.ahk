; Define here the path to your GTA5.exe
gta5_path := "D:\Games\Epic Games\GTAV"

; Key-shortcut (Ctrl+F5) to block GTA from accessing the internet
^f5::
; Set existing rule to block traffic
run, *runas %comspec% /c netsh advfirewall firewall set rule name="Grand Theft Auto V" new action=block,, hide, npPid
; Explicitly add a new rule to block incoming traffic to GTA5.exe
run, *runas %comspec% /c netsh advfirewall firewall add rule name="GTAVBlockButton" dir=in action=block profile=any program="%gta5_path%\GTA5.exe",, hide, npPid
; Explicitly add a new rule to block outgoing traffic to GTA5.exe
run, *runas %comspec% /c netsh advfirewall firewall add rule name="GTAVBlockButton" dir=out action=block profile=any program="%gta5_path%\GTA5.exe",, hide, npPid
return

; Key-shortcut (Ctrl+F6) to allow GTA from accessing the internet
^f6::
; Set existing rule to allow traffic
run, *runas %comspec% /c netsh advfirewall firewall set rule name="Grand Theft Auto V" new action=allow,, hide, npPid
; Delete the created rule
run, *runas %comspec% /c netsh advfirewall firewall delete rule name="GTAVBlockButton",, hide, npPid
return

; Key-shortcut (Ctrl+F12) to automatically block, wait 10sec and then allow GTA from accessing the internet
^f12::
; Set existing rule to block traffic
run, *runas %comspec% /c netsh advfirewall firewall set rule name="Grand Theft Auto V" new action=block,, hide, npPid
; Explicitly add a new rule to block incoming traffic to GTA5.exe
run, *runas %comspec% /c netsh advfirewall firewall add rule name="GTAVBlockButton" dir=in action=block profile=any program="%gta5_path%\GTA5.exe",, hide, npPid
; Explicitly add a new rule to block outgoing traffic to GTA5.exe
run, *runas %comspec% /c netsh advfirewall firewall add rule name="GTAVBlockButton" dir=out action=block profile=any program="%gta5_path%\GTA5.exe",, hide, npPid
Tooltip Blocking GTA5 for 10 sec..., 0, 0
DllCall("Sleep",UInt,10000)
Tooltip
; Set existing rule to allow traffic
run, *runas %comspec% /c netsh advfirewall firewall set rule name="Grand Theft Auto V" new action=allow,, hide, npPid
; Delete the created rule
run, *runas %comspec% /c netsh advfirewall firewall delete rule name="GTAVBlockButton",, hide, npPid
return
