#Persistent
#SingleInstance force

Interval := 25 ; The time (mins) between each alert
RelaxTimer := 0
MinsToNextAlert := Interval
SetTimer, RelaxEyeReminder, 60000
Gosub, UpdateToolTip ; Calling UpdateToolTip when starting because RelaxEyeReminder only runs 60 secs later
return

RelaxEyeReminder:
RelaxTimer := RelaxTimer + 1
MinsToNextAlert := MinsToNextAlert - 1
Gosub, UpdateToolTip

if (RelaxTimer = Interval) {
	SetTimer, RelaxEyeReminder, Off
	Gui -Resize -SysMenu
	Gui, Margin, 0, 0
	Gui, Font, s14 cBlue, Verdana
	Gui, Add, Text, y10 w300 Center, Stand UP and STRETCH
	Gui, Font, ,
	Gui, Font, , Verdana
	Gui, Add, Button, x105 y50 w90 gCloseReminder, I am back
	Gui, Show, w300 h90 xCenter yCenter, Relax Alert
	SoundPlay *48
}
return

CloseReminder:
RelaxTimer := 0
MinsToNextAlert := Interval
Gosub, UpdateToolTip
SetTimer, RelaxEyeReminder, On
Gui, Destroy
return

UpdateToolTip:
if (MinsToNextAlert > 1) {
	Menu, Tray, Tip, %MinsToNextAlert% minutes to next stretch
}
else if (MinsToNextAlert = 1) {
	Menu, Tray, Tip, %MinsToNextAlert% minute to next stretch
}
else {
	Menu, Tray, Tip, Stretching now...
}
return

GuiClose:
Gosub, CloseReminder
return
