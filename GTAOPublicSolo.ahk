; Original source for network disable and PublicSolo by reddit.com/u/CRlME (https://www.reddit.com/r/gtaglitches/comments/fycrzs/psapc_you_can_pull_your_ethernet_cable_with_a/)
; Original source for lucky wheel by reddit.com/u/Efeler_Gibi (https://www.reddit.com/r/gtaglitches/comments/gweo51/psa_i_wrote_a_very_simple_autohotkey_script_for/)
; Always run this as administrator!
; PreRequisits for lucky wheel
#NoEnv
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#KeyHistory 0
ListLines Off
SetBatchLines, -1
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
SetWinDelay, -1
SetControlDelay, -1
SendMode Input
SetWorkingDir %A_ScriptDir%

; Define here the path to your GTA5.exe
; Default paths are: "C:\Program Files (x86)\Steam\steamapps\common\Grand Theft Auto V" or "C:\Program Files\Rockstar Games\Grand Theft Auto V"
IniRead, gta5_path, GTAOPublicSolo.ini, GTAOPublicSoloConfig, gta5_path , C:\Program Files\Rockstar Games\Grand Theft Auto V

; Define the network adapter name
; To find out the name use "netsh interface ipv4 show config" in cmd
IniRead, network_adapter_name, GTAOPublicSolo.ini, GTAOPublicSoloConfig, network_adapter_name , "Ethernet"

; Key-shortcut (Ctrl+F1) to spin the lucky wheel
; You'll need a fresh wheel (arrow is pointing to clothing and vehicle is two to the left of the arrow) -> https://i.imgur.com/AATKGrC.png
; Set to "windowed borderless" screen type -> https://i.imgur.com/3yTC4l2.png
CoordMode, ToolTip, Screen
^f1:: ;Start the script.
	IniRead, delay, GTAOPublicSolo.ini, GTAOPublicSoloConfig, delay , "4454"
    SendInput {enter down}
    DllCall("Sleep",UInt,50)
    SendInput {enter up}
    DllCall("Sleep",UInt,500)
    Loop
    {
        PixelGetColor, color, 106, 38, RGB
        If (color = 0xE5E5E5)
        {
            Tooltip [F1] Waiting %delay% ms..., 0, 0
            DllCall("Sleep",UInt,delay)
            SendInput {s down}
            DllCall("Sleep",UInt,25)
            SendInput {s up}
            Tooltip
            Break
        }
    }
	return

; Key-shortcut (Ctrl+F11) to block GTA from accessing the internet for 25 sec
; This is to come back online
^f11::
	IniRead, timeout_F11, GTAOPublicSolo.ini, GTAOPublicSoloConfig, timeout_F11 , "15000"
	; Set network adapter to off
	run, *runas %comspec% /c netsh interface set interface name="%network_adapter_name%" admin=disabled,,hide 
	; Show the tooltip to inform user
	Tooltip [F11] Network adapter (%network_adapter_name%) is now disabled for %timeout_F11% millisec..., 10, 20
	; Wait 20 sec
	DllCall("Sleep",UInt,timeout_F11)
	Tooltip
	; Set network adapter to on
	run, *runas %comspec% /c netsh interface set interface name="%network_adapter_name%" admin=enabled,,hide
	return

; Key-shortcut (Ctrl+F12) to automatically block, wait 10sec and then allow GTA from accessing the internet
; This is for public solo mission
^f12::
	IniRead, timeout_F12, GTAOPublicSolo.ini, GTAOPublicSoloConfig, timeout_F12 , "10000"
	; Set existing rule to block traffic
	run, *runas %comspec% /c netsh advfirewall firewall set rule name="Grand Theft Auto V" new action=block,, hide, npPid
	; Explicitly add a new rule to block incoming traffic to GTA5.exe
	run, *runas %comspec% /c netsh advfirewall firewall add rule name="GTAVBlockButton" dir=in action=block profile=any program="%gta5_path%\GTA5.exe",, hide, npPid
	; Explicitly add a new rule to block outgoing traffic to GTA5.exe
	run, *runas %comspec% /c netsh advfirewall firewall add rule name="GTAVBlockButton" dir=out action=block profile=any program="%gta5_path%\GTA5.exe",, hide, npPid
	run, *runas %comspec% /c netsh advfirewall firewall add rule name="GTAVBlockButton" dir=out action=block profile=any program="%gta5_path%\PlayGTAV.exe",, hide, npPid
	run, *runas %comspec% /c netsh advfirewall firewall add rule name="GTAVBlockButton" dir=in action=block profile=any program="%gta5_path%\PlayGTAV.exe",, hide, npPid
	; Show the tooltip to inform user
	Tooltip [F12] Blocking GTA5 (%gta5_path%\GTA5.exe) for %timeout_F12% millisec..., 10, 20
	; Wait 10 sec
	DllCall("Sleep",UInt,timeout_F12)
	Tooltip
	; Set existing rule to allow traffic
	run, *runas %comspec% /c netsh advfirewall firewall set rule name="Grand Theft Auto V" new action=allow,, hide, npPid
	; Delete the created rule
	run, *runas %comspec% /c netsh advfirewall firewall delete rule name="GTAVBlockButton",, hide, npPid
	return
