#Persistent

RelaxTimer := 0
Interval := 23
MinsToNextAlert := Interval
SetTimer, RelaxEyeReminder, 60000
Gosub, UpdateToolTip
return

RelaxEyeReminder:
RelaxTimer := RelaxTimer + 1
MinsToNextAlert := MinsToNextAlert - 1
Gosub, UpdateToolTip
if (RelaxTimer = Interval) {
SetTimer, RelaxEyeReminder, Off
Gui -Resize -MinimizeBox
Gui, Margin, 0, 0
Gui, Font, s14 cBlue, Verdana
Gui, Add, Text, y10 w300 Center, Stand UP and STRETCH
Gui, Font, ,
Gui, Font, , Verdana
Gui, Add, Button, x105 y50 w90 gCloseReminder, I am back
Gui, Show, w300 h90 xCenter yCenter, Relax Alert
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
