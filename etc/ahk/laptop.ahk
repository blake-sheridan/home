#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.

; Only ever activate a single instance of this script
#SingleInstance Force


browser_again(window) {
    WinGet saved_id, , A
    WinActivate ahk_id %window_id%
    Send ^R
    WinActivate ahk_id %saved_id%
}

terminal_again(window_id) {
    WinGet saved_id, , A
    WinActivate ahk_id %window_id%
    Send ^P{Enter}
    WinActivate ahk_id %saved_id%
}

tile(window_id, x_start, x_stop, y_start, y_stop) {
    ; Tile a window using subranges of the current desktop
    SysGet workarea_, MonitorWorkArea

    ; MsgBox %x_start% %x_stop% %y_start% %y_stop%

    workarea_width  :=  workarea_Right - workarea_Left
    workarea_height := workarea_Bottom - workarea_Top

    width  := (x_stop - x_start) / 100 * workarea_width
    height := (y_stop - y_start) / 100 * workarea_height

    x := workarea_Left + (x_start / 100 * workarea_width)
    y :=  workarea_Top + (y_start / 100 * workarea_height)

    if window_id
        WinMove ahk_id %window_id%, , %x%, %y%, %width%, %height%
}

f1_id := 0
f2_id := 0
f3_id := 0
f4_id := 0
f5_id := 0
f6_id := 0

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


^!F1::
MouseGetPos, _, _, f1_id
return

^!F2::
MouseGetPos, _, _, f2_id
return

^!F3::
MouseGetPos, _, _, f3_id
return

^!F4::
MouseGetPos, _, _, f4_id
return

^!F5::
MouseGetPos, _, _, f5_id
return

^!F6::
MouseGetPos, _, _, f6_id
return


^F1::
tile(f4_id,  0,  33,   0,  50)
tile(f5_id,  0,  33,  50, 100)
tile(f1_id, 33,  66,   0, 100)
tile(f3_id, 66, 100,   0,  50)
tile(f2_id, 66, 100,  50, 100)
return

^F2::
terminal_again(f2_id)
return

^F3::
terminal_again(f3_id)
return

^F4::
browser_again(f4_id)
return
