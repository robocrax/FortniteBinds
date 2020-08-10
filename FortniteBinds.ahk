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



































; ChargeFixMode := false
; ShotgunOut := false


; n::
; ChargeFixMode := !ChargeFixMode
; ShotgunOut := false        ; if module disabled then can't make toggle to work so force disable
; SoundBeep
; if ChargeFixMode
; {
;     SoundBeep, ,100
; }
; return





; #If ChargeFixMode

; ~WheelUp::
; ShotgunOut := true
; return

; LButton up::
; Send {LButton up}
; return

; ; ~q::
; ; ~e::
; ; ~LShift::
; ; ~4::
; ~1::
; ~2::
; ~3::
; ~5::
; ~6::
; ~c::
; ~Tab::
; ~WheelDown::
; ~g::
; ~f::
; ~m::
; ShotgunOut := false
; return

; ~LWin::
; ShotgunOut := false
; ChargeFixMode := false
; SoundBeep
; Return

; #if



; #If ShotgunOut

; ~q::
; ~e::
; ~LShift::
; ~4::
; If (GetKeyState("LButton", "P"))
; {
;     Send {LButton up}{LButton}{LButton down}
;     ShotgunOut := false
; }
; return

; LButton::
; Send 9{LButton}9{LButton}
; return

; RButton::
; Send {LButton down}
; Send {RButton down}
; return

; RButton up::
; Send {RButton up}
; Send 1{LButton up}{WheelUp}
; return


; #if



















; builder pro config now. beta 1
; 5: wall, stair, floor, cone, trap

; Buildmode=0

; ~q::
; sleep 5
; Send {LButton down}
; Buildmode++
; KeyWait, q
; return

; ~e::
; sleep 5
; Send {LButton down}
; Buildmode++
; KeyWait, e
; return

; ~4::
; sleep 5
; Send {LButton down}
; Buildmode++
; KeyWait, 4
; return

; ~LShift::
; sleep 5
; Send {LButton down}
; Buildmode++
; KeyWait, LShift
; return

; ~t::
; sleep 5
; Send {LButton down}
; Buildmode++
; KeyWait, t
; return

; ; same 4 but incase you press em at the same time

; q Up::
; Buildmode--
; if (Buildmode < 1)
; {
;     Send {LButton up}
; }
; return

; e Up::
; Buildmode--
; if (Buildmode < 1)
; {
;     Send {LButton up}
; }
; return

; 4 Up::
; Buildmode--
; if (Buildmode < 1)
; {
;     Send {LButton up}
; }
; return

; LShift Up::
; Buildmode--
; if (Buildmode < 1)
; {
;     Send {LButton up}
; }
; return

; t Up::
; Buildmode--
; if (Buildmode < 1)
; {
;     Send {LButton up}
; }
; return



