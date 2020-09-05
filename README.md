# GTAOPublicSolo
AHK Script to quickly create a GTA Online Public Solo Session

## What you'll need:
1. Windows Firewall enabled
2. AutoHotKey from https://www.autohotkey.com/ (The version doesn't matter)
3. The path in which your GTA5.exe is located
4. Administrator rights

## How it works:
1. Download the .ahk file from the repo
2. Edit the .ahk file
3. Insert your path in the first line, without the trailing backslash (e.g. "C:\GTAV" instead of "C:\GTAV\\")
4. Right click the file -> Run as administrator
5. Start GTA Online
6. As soon as you're in a public session press either:

    6a. Ctrl+F12 to automatically block, wait 10sec and then allow GTA from accessing the internet
    
    6b. Ctrl+F5 to manually block GTA from the internet, wait 10sec and then press Ctrl+F6 to allow GTA from accessing the internet
    
## What the script does:
Adds a temporary Windows firewall rule to block the GTA5.exe from accessing the internet
