; have to do this for some reasons
#NoEnv
#SingleInstance Force

; this hotkey works outside Fortnite (failsafe)
; assuming Lwin is not spammed that hard (usually not) or else unneccesary runs
Hotkey, ~LWin, DISABLE_AFK_MACROS

SetTitleMatchMode, 1
#IfWinActive Fortnite

; Changeable part

    ; delay between edits
    PING = 22     ; do not even think of values below 5. definitely not zero
    BUILD_PULLOUT = %PING%*2
    WEAPON_PULLOUT = %PING%*2

    ; Keymapping
    ; HINT: use AHK List of keys for non-alphabet keys
    ;       dont cover in curly braces, script does that

    Hotkey, F5, SCRIPT_RELOAD

    ; ; AFK stuff
    ; Hotkey, F1, AFK_SERPENTAU   ; define keys below in Edit section
    ; Hotkey, F2, AFK_TURBO_AUTOPICKUP
    INVENTORY_PICKUP_BIND := "v"
    ; Hotkey, F3, AFK_EMOTE
    LAST_EMOTE_BIND := "NumpadEnter"
    ; Hotkey, F4, AFK_BETA_PROJECT2

    ; ; Auto run not toggle
    ; Hotkey, `, AUTO_SPRINT

    ; Double movement keys (30 deg to 60 deg)
    ~a::Left
    ~d::Right

    ; Edit
    Hotkey, ~f, EDIT_BIND
    RESET_EDIT_BIND := "'"
    EDIT_WITH := "RButton"
    PLACE_BUILD := "LButton"
    PRIMARY_EDIT_BIND := "f"
    SECONDARY_EDIT_BIND := "g"

    HOLD_TO_DOUBLE_EDIT_RAMP_WALL = false
    HOLD_DELAY = 0.15 ; which translates to 150ms

    ; ; Builds
    ; Hotkey, q, BUILD_WALL
    ; Hotkey, e, BUILD_RAMP
    ; Hotkey, LShift, BUILD_FLAT
    ; Hotkey, =, BUILD_CONE

    ; ; Weapons
    ; Hotkey, WheelUp, WEAPON_NUMBER_1
    ; Hotkey, WheelDown, WEAPON_NUMBER_2
    ; Hotkey, 3, WEAPON_NUMBER_3
    ; Hotkey, C, WEAPON_NUMBER_4
    ; Hotkey, 2, WEAPON_NUMBER_5

    ; ; Turbo click on weapn
    ; Hotkey, F6, WEAPON_TURBO_MODE

    ; ; Specials: ryuzanami quick drop/split weapon/item
    ; ; warn: do not use arrow keys to select mats/utility or this will not work for the period of the match. resets every match
    ; Hotkey, LAlt, SP_SPLIT_WEAPON

    ; ; Specials: clix pb&j counter ramp
    ; Hotkey, 6, SP_CLIX_PBJ

    ; ; Specials: bugha reversed ramp endgame rotate (and more uses as well)
    ; Hotkey, 7, SP_REVERSE_RAMP















; Functions start

DISABLE_AFK_MACROS:
    SerpentMode := false
    PickUpMode := false
    EmoteMode := false
    AutoFarmMode := false
return

SCRIPT_RELOAD:
    Reload
return



; reset every edit when pressing edit
EDIT_BIND:
sleep %PING%
Send {%RESET_EDIT_BIND%}
if (%HOLD_TO_DOUBLE_EDIT_RAMP_WALL%) {
    KeyWait, f, T%HOLD_DELAY%
    If ErrorLevel {
        Send, {%EDIT_WITH%}
        sleep %PING%*3
        Send, %PRIMARY_EDIT_BIND%
        sleep %PING%+1
        Send {%RESET_EDIT_BIND%}
        sleep %PING%*3
        Send, {%EDIT_WITH%}
    }
}
return


; don't toggle autorun but infact auto RUN!
`::
Send {w down}
sleep 300
Send {w up}{MButton}
return


; AFK macros

; turbo edit
F1::
{
   SerpentMode := true
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
   PickUpMode := true

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
   EmoteMode := true

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

















; custom cone function

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














; Ryuzanami instant reload test 1

;reset (like reset CSS)
HasVal1 := false
HasVal2 := false
HasVal3 := false
HasVal4 := false
HasVal5 := false

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




;turbo-fy

#If MakeTurboClick
~LButton::
While (GetKeyState("LButton", "P")) {
    Send, {LButton}
    sleep 45
}
MakeTurboClick := false
#if






















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