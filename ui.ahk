#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


#SingleInstance Force


; Globals
f1_id := 0
f2_id := 0
f3_id := 0
f4_id := 0
f5_id := 0
f6_id := 0
f7_id := 0
f8_id := 0
f9_id := 0
f10_id := 0
f11_id := 0
f12_id := 0


F1::
WinActivate, ahk_id %f1_id%
return
F2::
WinActivate, ahk_id %f2_id%
return
F3::
WinActivate, ahk_id %f3_id%
return
F4::
WinActivate, ahk_id %f4_id%
return
F5::
WinActivate, ahk_id %f5_id%
return
F6::
WinActivate, ahk_id %f6_id%
return
F7::
WinActivate, ahk_id %f7_id%
return
F8::
WinActivate, ahk_id %f8_id%
return
F9::
WinActivate, ahk_id %f9_id%
return
F10::
WinActivate, ahk_id %f10_id%
return
F11::
WinActivate, ahk_id %f11_id%
return
F12::
WinActivate, ahk_id %f12_id%
return


#!F1::
MouseGetPos, _, _, f1_id
return
#!F2::
MouseGetPos, _, _, f2_id
return
#!F3::
MouseGetPos, _, _, f3_id
return
#!F4::
MouseGetPos, _, _, f4_id
return
#!F5::
MouseGetPos, _, _, f5_id
return
#!F6::
MouseGetPos, _, _, f6_id
return
#!F7::
MouseGetPos, _, _, f7_id
return
#!F8::
MouseGetPos, _, _, f8_id
return
#!F9::
MouseGetPos, _, _, f9_id
return
#!F10::
MouseGetPos, _, _, f10_id
return
#!F11::
MouseGetPos, _, _, f11_id
return
#!F12::
MouseGetPos, _, _, f12_id
return


tile(x_lower, x_upper, y_lower, y_upper) {
    SysGet, workarea_, MonitorWorkArea

    workarea_width := workarea_Right - workarea_Left
    workarea_height := workarea_Bottom - workarea_Top

    width := (x_upper - x_lower) * workarea_width
    height := (y_upper - y_lower) * workarea_height

    x := workarea_Left + (x_lower * workarea_width)
    y := workarea_Top + (y_lower * workarea_height)

    WinMove, A, , %x%, %y%, %width%, %height%
}


#F1::
tile(0, 0.33, 0.5, 1)
return
#F2::
tile(0.33, 0.66, 0.5, 1)
return
#F3::
tile(0.66, 1, 0.5, 1)
return
#F4::
tile(0, 0.33, 0, 0.5)
return
#F5::
tile(0.33, 0.66, 0, 0.5)
return
#F6::
tile(0.66, 1, 0, 0.5)
return
