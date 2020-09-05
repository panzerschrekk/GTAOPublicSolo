# GTAOPublicSolo
AHK Script to quickly create a GTA Online Public Solo Session

## What you'll need:
1. Windows Firewall enabled
2. AutoHotKey from https://www.autohotkey.com/ (The version doesn't matter)
3. The path to the folder in which your GTA5.exe is located
4. Administrator rights

## How it works:
1. Download the .ahk file from the repo
2. Edit the .ahk file
2. Insert your path in the first line, without the trailing backslash (e.g. "C:\GTAV" instead of "C:\GTAV\")
2. Right click the file -> Run as administrator
3. Start GTA Online
4. As soon as you're in a public session press either:
    4a. Ctrl+F12 to automatically disconnet and connect
    4b. Ctrl+F5 do block GTA from the internet, wait 10sec and then press Ctrl+F6 to allow GTA from accessing the internet
    
## What the script does:
Adds a Windows firewall rule to block the exe from accessing the internet
