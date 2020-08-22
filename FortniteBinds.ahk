SetTitleMatchMode, 1
#IfWinActive Fortnite
#SingleInstance Force






; 60deg instead of 30deg full sprint towards direction
~a::Left
~d::Right



; reset every edit when pressing edit
~f::
sleep 22
Send {'}
return



; turbo edit
F1::
{
   SerpentMode := !SerpentMode
   While, SerpentMode
    {
        Send g
        sleep 65
        Send {RButton}
        sleep 65
    }
}
return

; auto pick glitch orangeguy
F2::
{
   PickUpMode := !PickUpMode

   While, PickUpMode
    {
        Send v
        sleep 35
    }
}
return

; continous repeat last emote spam
F3::
{
   EmoteMode := !EmoteMode

   While, EmoteMode
    {
        Send {NumpadEnter}
        sleep 3035
    }
}
return

; auto farm, hopefully... fully depends on environment
F4::
{
   AutoFarmMode := !AutoFarmMode

   While, AutoFarmMode
    {
        Send b4
        sleep 3035
    }
}
return

~LWin::
F5::
SerpentMode := false
PickUpMode := false
EmoteMode := false
AutoFarmMode := false
return






; don't toggle autorun but infact auto RUN!
`::
Send {w down}
sleep 100
Send {w up}{MButton}
return








; reversed ramp (only works if building mode is active, or else fails
; reason for this is that I wanted it fast enough it's unnoticable so pls build mode)
7::
SetKeyDelay, 10
Send, e
sleep 40
Send, ey8
SendEvent, {LButton down}
KeyWait, 7
SendEvent, {LButton up}
Send, ey8
return



; one rotate ramp to block clix-pb&j (only works if building mode is active, or else fails
; reason for this is that I wanted it fast enough it's unnoticable so pls build mode)
6::
SetKeyDelay, 10
Send, e
sleep 40
Send, ey
SendEvent, {LButton down}
KeyWait, 6
SendEvent, {LButton up}
Send, ey8y
return









XButton2::
Send, =
SendEvent, {LButton down}
ClickIsOn := true
KeyWait, XButton2
ClickIsOn := false
If (!GetKeyState("LButton", "P")) {
    SendEvent, {LButton up}
}

; added later: switch to previous build piece as i was expecting that
if (WeaponNumber Between 6 and 8) {
    switch WeaponNumber
    {
        Case 6: Send, q
        Case 7: Send, e
        Case 8: Send, {LShift}
    }
}
return


#If ClickIsOn

~q up::
~e up::
~LShift up::
sleep 10
Send, =
return

; disable LB up bcoz it'll be triggered afterwards any way (merge 2 functions coz of same time exec)
LButton up::
return

#if











~z::
DllCall("mouse_event", "UInt", 0x01, "UInt", 3000, "UInt", 0) 
return






; Ryuzanami instant reload test 1
;first get vars
~WheelUp::
WeaponNumber := 1
If (HasVal1) {
    MakeTurboClick := true
}
return
~WheelDown::
WeaponNumber := 2
If (HasVal2) {
    MakeTurboClick := true
}
return
~3::
WeaponNumber := 3
If (HasVal3) {
    MakeTurboClick := true
}
return
~c::
WeaponNumber := 4
If (HasVal4) {
    MakeTurboClick := true
}
return
~2::
WeaponNumber := 5
If (HasVal5) {
    MakeTurboClick := true
}
return




; now considering building as WeaponNumber to make it easier for me

; q WALL 6
; e STARIS 7
; LShift FLOOR 8


~q::
WeaponNumber := 6
return

~e::
WeaponNumber := 7
return

~LShift::
WeaponNumber := 8
return
























; ryuzanami quick split weapons

4::
Send, i
sleep 30
; Loop WeaponNumber times
LoopTimes := %WeaponNumber%-1
Loop %LoopTimes%                            ;The number is the amount of times the code is looped
{ 
    Send, {Right}
    sleep 30
}
Send, z
sleep 20
Send, i
If (GetKeyState("w", "P")) {
    SendEvent, {w down}
}
return






























; Attempt to make turbo keys more flexible   [toggle mode not force mode]

F6::
Input, ToggleKeyForTurbo, L1 T5 M  ; get a key press, timeout 5 seconds and cancel registration 
WhichKey := HasVal([",", ".", "3", "c", "2"], ToggleKeyForTurbo)    ; minus one to make it same as WeaponNumber

if (WhichKey == 0) {
    return
} else {
    HasVal%WhichKey% := !HasVal%WhichKey%
}

return

; lib: https://www.autohotkey.com/boards/viewtopic.php?p=109173#p109173
HasVal(haystack, needle) {
	if !(IsObject(haystack)) || (haystack.Length() = 0)
		return 0
	for index, value in haystack
		if (value = needle)
			return index
	return 0
}


; The Weapon Numbers I'm already tracking from the macro above

#If MakeTurboClick
~LButton::
While (GetKeyState("LButton", "P")) {
    Send, {LButton}
    sleep 45
}
MakeTurboClick := false
#if
