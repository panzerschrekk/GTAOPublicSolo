# GTAOPublicSolo
AHK Script to quickly create a GTA Online Public Solo Session, turn off/on a network adapter and spin the lucky wheel

## What you'll need:
1. Windows Firewall enabled (https://support.microsoft.com/en-us/help/4028544/windows-10-turn-microsoft-defender-firewall-on-or-off)
2. AutoHotKey from https://www.autohotkey.com/ (The version doesn't matter)
3. The path to your GTA5.exe is located
4. Administrator rights
5. Network adapter name to be disabled (use "netsh interface ipv4 show config" to find out which one)

## How it works:
1. Download the .exe and .ini file from the repo (https://github.com/panzerschrekk/GTAOPublicSolo/raw/master/GTAOPublicSolo.exe and https://github.com/panzerschrekk/GTAOPublicSolo/raw/master/GTAOPublicSolo.ini)
2. Insert your path in the GTAOPublicSolo.ini file, without the trailing backslash (e.g. "C:\GTAV" instead of "C:\GTAV\\")
3. Insert your network adapter name in the GTAOPublicSolo.ini file
4. Right click the file -> Run as administrator
5. Start GTA Online
6. As soon as you're in a public session (you see your character) press either:

    7a. Ctrl+F12 to automatically block, wait 10sec and then allow GTA from accessing the internet (e.g. public solo session)
    
    7b. Ctrl+F5 to disable the network adapter and Ctrl+F6 to enable the network adapter (e.g. you landed on the wrong spot on the lucky wheel)
    
    7c. Ctrl+F11 to disable the network adapter, wait 25sec and then enable the network adapter (e.g. you landed on the wrong spot on the lucky wheel)
    
    7c. Ctrl+F1 to spin the lucky wheel (only while you see exactly this screen: https://i.imgur.com/AATKGrC.png) , you'll probably have to change the "delay" value in the GTAOPublicSolo.ini file to work for your pc
    
## What the script does:
Adds a temporary Windows firewall rule to block GTA5.exe from accessing the internet
Turns off the network adapter completely
Spins the lucky wheel on a precisely defined value

## Compability
### Tested
- Windows 10
- Epic Games Version of GTA5
- Rockstar Games Version of GTA5

### Not tested, but probably works
- Windows 8.1, 8.0 and 7
- Steam Version of GTA5

### Doesn't work
- Windows XP

### Credits
Original source for network disable and PublicSolo by reddit.com/u/CRlME (https://www.reddit.com/r/gtaglitches/comments/fycrzs/psapc_you_can_pull_your_ethernet_cable_with_a/)

Original source for lucky wheel by reddit.com/u/Efeler_Gibi (https://www.reddit.com/r/gtaglitches/comments/gweo51/psa_i_wrote_a_very_simple_autohotkey_script_for/)
