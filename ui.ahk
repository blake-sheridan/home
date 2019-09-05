#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.

; Only ever activate a single instance of this scripts
#SingleInstance Force


tile(window_id, x_start, x_stop, y_start, y_stop) {
    ; Tile a window from x_start:x_stop, y_start:y_stop
    ; start/stop should be numbers from 0 to 1
    SysGet, workarea_, MonitorWorkArea

    workarea_width  :=  workarea_Right - workarea_Left
    workarea_height := workarea_Bottom - workarea_Top

    width  := (x_stop - x_start) * workarea_width
    height := (y_stop - y_start) * workarea_height

    x := workarea_Left + (x_start * workarea_width)
    y :=  workarea_Top + (y_start * workarea_height)

    if window_id
        WinMove, ahk_id %window_id%,, %x%, %y%, %width%, %height%
}


; Grid is a 3x2 matrix of windows:
; alt+f1 | alt+f2 | alt+f3
;     f1 |     f2 |     f3

f1_id := 0
f2_id := 0
f3_id := 0

alt_f1_id := 0
alt_f2_id := 0
alt_f3_id := 0

F1::
WinActivate, ahk_id %f1_id%
return
F2::
WinActivate, ahk_id %f2_id%
return
F3::
WinActivate, ahk_id %f3_id%
return
!F1:
WinActivate, ahk_id %alt_f1_id%
return
!F2:
WinActivate, ahk_id %alt_f2_id%
return
!F3:
WinActivate, ahk_id %alt_f3_id%
return

#F1::
MouseGetPos, _, _, f1_id
return
#F2::
MouseGetPos, _, _, f2_id
return
#F3::
MouseGetPos, _, _, f3_id
return
#!F1::
MouseGetPos, _, _, alt_f1_id
return
#!F2::
MouseGetPos, _, _, alt_f2_id
return
#!F3::
MouseGetPos, _, _, alt_f3_id
return

#F4::
tile(    f1_id,    0, 0.33, 0.5,   1)
tile(    f2_id, 0.33, 0.66, 0.5,   1)
tile(    f3_id, 0.66, 1.00, 0.5,   1)
tile(alt_f1_id,    0, 0.33,   0, 0.5)
tile(alt_f2_id, 0.33, 0.66,   0, 0.5)
tile(alt_f3_id, 0.66, 1.00,   0, 0.5)
return
