; Define here the path to your GTA5.exe
; Default paths are: "C:\Program Files (x86)\Steam\steamapps\common\Grand Theft Auto V" or "C:\Program Files\Rockstar Games\Grand Theft Auto V"
gta5_path := "C:\Program Files\Rockstar Games\Grand Theft Auto V"

; Define the network adapter name
; To find out the name use "netsh interface ipv4 show config" in cmd
; Original source by reddit.com/u/CRlME
network_adapter_name := "Ethernet"

; Key-shortcut (Ctrl+F5) to block GTA from accessing the internet
^f5::
; Set network adapter to off
run, *runas %comspec% /c netsh interface set interface name="%network_adapter_name%" admin=disabled,,hide 
; Show the tooltip to inform user
Tooltip Network adapter is now disabled, 10, 20
; Wait 2 sec
DllCall("Sleep",UInt,2000)
Tooltip
return

; Key-shortcut (Ctrl+F6) to allow GTA from accessing the internet
^f6::
; Set network adapter to on
run, *runas %comspec% /c netsh interface set interface name="%network_adapter_name%" admin=enabled,,hide
; Show the tooltip to inform user
Tooltip Network adapter is now enabled, 10, 20
; Wait 2 sec
DllCall("Sleep",UInt,2000)
Tooltip
return

; Key-shortcut (Ctrl+F12) to automatically block, wait 10sec and then allow GTA from accessing the internet
; This is for public solo mission
^f12::
; Set existing rule to block traffic
run, *runas %comspec% /c netsh advfirewall firewall set rule name="Grand Theft Auto V" new action=block,, hide, npPid
; Explicitly add a new rule to block incoming traffic to GTA5.exe
run, *runas %comspec% /c netsh advfirewall firewall add rule name="GTAVBlockButton" dir=in action=block profile=any program="%gta5_path%\GTA5.exe",, hide, npPid
; Explicitly add a new rule to block outgoing traffic to GTA5.exe
run, *runas %comspec% /c netsh advfirewall firewall add rule name="GTAVBlockButton" dir=out action=block profile=any program="%gta5_path%\GTA5.exe",, hide, npPid
run, *runas %comspec% /c netsh advfirewall firewall add rule name="GTAVBlockButton" dir=out action=block profile=any program="%gta5_path%\PlayGTAV.exe",, hide, npPid
run, *runas %comspec% /c netsh advfirewall firewall add rule name="GTAVBlockButton" dir=in action=block profile=any program="%gta5_path%\PlayGTAV.exe",, hide, npPid
; Show the tooltip to inform user
Tooltip Blocking GTA5 for 10 sec..., 10, 20
; Wait 10 sec
DllCall("Sleep",UInt,10000)
Tooltip
; Set existing rule to allow traffic
run, *runas %comspec% /c netsh advfirewall firewall set rule name="Grand Theft Auto V" new action=allow,, hide, npPid
; Delete the created rule
run, *runas %comspec% /c netsh advfirewall firewall delete rule name="GTAVBlockButton",, hide, npPid
return
