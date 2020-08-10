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
WeaponNumber := 0
return
~WheelDown::
WeaponNumber := 1
return
~3::
WeaponNumber := 2
return
~c::
WeaponNumber := 3
return
~2::
WeaponNumber := 4
return

4::
Send, i
sleep 30
; Loop WeaponNumber times
Loop %WeaponNumber%                            ;The number is the amount of times the code is looped
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















; Quick split mats (CANCELED: affects quick reload for weapons... pointer moves position after this)
; /::
; Send, i
; sleep 30
; Send, {Up}
; sleep 30
; Loop 3                            ;assuming first 3 ammos are shared.. not more
; { 
;     Send, {Right}
;     sleep 20
;     Send, z
;     sleep 30
; }
; Send, {Up}
; sleep 30
; Loop 3                            ;assuming first 3 ammos are shared.. not more
; { 
;     Send, {Right}
;     sleep 20
;     Send, z
;     sleep 30
; }
; sleep 20
; Send, i
; return



















; Attempt to make turbo keys more flexible

F6::
Input, ToggleKeyForTurbo, L1 T5   ; get a key press, timeout 5 seconds and cancel registration
If (ErrorLevel = Timeout) {
    return
}

WhichKey := HasVal(["WheelUp", "WheelDown", "3", "c", "2"], ToggleKeyForTurbo)

if (WhichKey == 0) {
    return
} else {
    HasVal%WhichKey% := !HasVal%WhichKey%
}

; IDK what I'm doing here... we skip over
; TurboVarName := false
; TurboVarName := Turbo_%ToggleKeyForTurbo%

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

#If HasVal1
~LButton::
While (GetKeyState("LButton", "P") && (WeaponNumber == 0)) {
    Send, LButton
    sleep 50
}
#if

#If HasVal2
~LButton::
While (GetKeyState("LButton", "P") && (WeaponNumber == 1)) {
    Send, LButton
    sleep 50
}
#if

#If HasVal3
~LButton::
While (GetKeyState("LButton", "P") && (WeaponNumber == 2)) {
    Send, LButton
    sleep 50
}
#if

#If HasVal4
~LButton::
While (GetKeyState("LButton", "P") && (WeaponNumber == 3)) {
    Send, LButton
    sleep 50
}
#if

#If HasVal5
~LButton::
While (GetKeyState("LButton", "P") && (WeaponNumber == 4)) {
    Send, LButton
    sleep 50
}
#if