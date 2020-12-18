#SingleInstance, force
LastPrzyciskStart := F1
isStarted := false
timePerBlockWalk := 232.5
stopLoop := 1
loopCount := 0
end := 0
idzPrzodTyl := 1
editColor = 453F3F;
Gui MyGui:new,, rekrutacja :: MLSK
Gui, +LastFound
Gui, Margin, 0, 0
gui, font, S24 2f3b4b, Helvetica Neue
gui, color, 453F3F
gui, font, S24 CAACCFF, Helvetica Neue
gui, font, S12 CAACCFF, Helvetica Neue
Gui, Color,, %editColor%
gui, font, S8 W500 tBold Cwhite, Helvetica Neue
Gui, Add, Text, cFuchsia center H50 Y50 X680,Pozdro :)
Gui, Add, Text, cGray center H50 Y70 X590,kolorki mozesz tu wybrac:
Gui, Add, Text, cGray center H50 Y90 X640,modek.xyz/mc
Gui, Add, Text, center H50 Y100 X30,Przycisk chatu:
Gui, Add, Text, center H50 Y50 X30,Przycisk startu:
Gui, Add, Text, center H50 Y150 X30,Komendy:
Gui, Add, Text, center H50 X600 Y200,Ilosc tur:
Gui, Add, DropDownList , gupdateStartKey vPrzyciskStart Choose10 X140 Y50 W60 H275 hwndhCB2 , F1|F2|F3|F4|F5|F6|F7|F8|F9|DEL
gui, font, S12 W700 s10 tBold Cwhite, Helvetica Neue
Gui, Add, Edit, vPrzyciskChat center X140 Y100 W37 H20 limit1 -vscroll -E0x200, t
Gui, Add, Edit, vcmdcmd1 hidden center X30 Y200 W500 H20 -vscroll -E0x200, Rekrutacja do MLSK : min. 15 lat : MUTACJA : PREMKA : ts3 na pw
Gui, Add, Edit, vcmdedit1 hidden center Number X663 Y200 W32 H20 limit3 -vscroll -E0x200, 10
Gui, Add, Edit, vcmdcmd2 hidden center X30 Y250 W500 H20-vscroll -E0x200, /r MCTS.PL - sama gora :: sory za spam (BOT)
Gui, Add, Edit, vcmdedit2 hidden center Number X663 Y250 W32 H20 limit3 -vscroll -E0x200, 10
Gui, Add, Edit, vcmdCount center Number X658 Y137 W45 H20 limit3 -vscroll -E0x200, 0
Gui, Add, UpDown, gcmdCountChange Range2-2 -vscroll -E0x200, 1
Gui, Show, center W750 H300
Gosub, cmdCountChange
Gosub, updateStartKey
Gosub, init
return
Check:
Gui, Submit, NoHide
if (RadioGroup1){
idzPrzodTyl = 0
}
if (RadioGroup2){
idzPrzodTyl = 1
}
Return
OnExit:
return
MyGuiGuiClose:
ExitApp
return
updateStartKey:
if (LastPrzyciskStart != ""){
Hotkey,*%LastPrzyciskStart%, off
}
GuiControlGet, PrzyciskStart
Hotkey,*%PrzyciskStart%,toogle
Hotkey,*%PrzyciskStart%,on
LastPrzyciskStart = %PrzyciskStart%
return
toogle:
if (isStarted = 1){
Gosub, stop
}else{
Gosub, start
}
return
stop:
if (isStarted = 1){
stopLoop = 1
isStarted = 0
}
return
start:
if (isStarted = 0){
stopLoop = 0
isStarted = 1
}
return
init:
loopCountEat = 0
loopCount1 = 0
loopCount2 = 0
loopCount3 = 0
loopCount4 = 0
loopCount5 = 0
Loop{
global stopLoop
global end
GuiControlGet, ileMaszStoniarek, MyGui:, IloscStoniarek
GuiControlGet, iloscKomend, MyGui:, cmdCount
GuiControlGet, przyciskDoOtwarciaChatu, MyGui:, PrzyciskChat
if (stopLoop = 0){
send {a down}
sleep (ileMaszStoniarek)*timePerBlockWalk
if (stopLoop = 0){
if (idzPrzodTyl = 1){
send {w down}
sleep timePerBlockWalk*5
send {w up}
}
if (stopLoop = 0){
send {a up}
send {d down}
sleep (ileMaszStoniarek)*timePerBlockWalk
if (stopLoop = 0){
if (idzPrzodTyl = 1){
send {s down}
sleep timePerBlockWalk*5
send {s up}
}
if (stopLoop = 0){
send {d up}
loop, %iloscKomend%{
loopCount%A_Index%++
GuiControlGet, przejscia, MyGui:, cmdedit%A_Index%
if (loopCount%A_Index% >= przejscia){
GuiControlGet, komenda, MyGui:, cmdcmd%A_Index%
send %przyciskDoOtwarciaChatu%
sleep 100
if (stopLoop = 0){
send %komenda%
sleep 100
if (stopLoop = 0){
send {Enter}
sleep 100
if (stopLoop = 0){
loopCount%A_Index% = 0
}
}
}
}
}
if (czyMaJesc = 1){
loopCountEat++
if (loopCountEat >= przejsciaJedzenie){
send %naKtorymSlocieMaszJedzenie%
sleep 2000
if (stopLoop = 0){
send %naKtorymSlocieMaszKilof%
sleep 100
if (stopLoop = 0){
loopCountEat = 0
}
}
}
}
}
}
}
}
send {w up}
send {s up}
send {a up}
send {d up}
}else{
sleep 1000
}
if (end = 1){
break
}
}
sleep 500
msgbox 1
ExitApp
return
cmdCountChange:
GuiControlGet, cmdCount
loop, 9{
guiControl, hide, cmdcmd%A_Index%
guiControl, hide, cmdedit%A_Index%
}
if (cmdCount >= 1){
guiControl, show, cmdcmd1
guiControl, show, cmdedit1
}
if (cmdCount >= 2){
guiControl, show, cmdcmd2
guiControl, show, cmdedit2
}
return
