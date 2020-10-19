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

; Define here the path to your GTA5.exe
; Default paths are: "C:\Program Files (x86)\Steam\steamapps\common\Grand Theft Auto V" or "C:\Program Files\Rockstar Games\Grand Theft Auto V"
gta5_path := "C:\Program Files\Rockstar Games\Grand Theft Auto V"

; Define the network adapter name
; To find out the name use "netsh interface ipv4 show config" in cmd
network_adapter_name := "Ethernet"

;Edit this value to change the spinning speed: higher value = slower spin
delay := 4454

; Key-shortcut (Ctrl+F1) to spin the lucky wheel
; You'll need a fresh wheel (arrow is pointing to clothing and vehicle is two to the left of the arrow) -> https://i.imgur.com/AATKGrC.png
; Set to "windowed borderless" screen type -> https://i.imgur.com/3yTC4l2.png
CoordMode, ToolTip, Screen
^f1:: ;Start the script.
    SendInput {enter down}
    DllCall("Sleep",UInt,50)
    SendInput {enter up}
    DllCall("Sleep",UInt,500)
    Loop
    {
        PixelGetColor, color, 106, 38, RGB
        If (color = 0xE5E5E5)
        {
            Tooltip Waiting %delay% ms..., 0, 0
            DllCall("Sleep",UInt,delay)
            SendInput {s down}
            DllCall("Sleep",UInt,500)
            SendInput {s up}
            Tooltip
            Break
        }
    }
	return

; Key-shortcut (Ctrl+F5) to block GTA from accessing the internet
; This is to go completely offline
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
; This is to come back online
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
