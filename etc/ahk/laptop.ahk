#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.

; Only ever activate a single instance of this script
#SingleInstance Force


run_last_command(terminal_id) {
    ; Run the last command in a terminal again
    WinGet saved_id, , A

    WinActivate ahk_id %terminal_id%
    Send {Up}{Enter}

    WinActivate ahk_id %saved_id%
}


tile(window_id, x_start, x_stop, y_start, y_stop) {
    ; Tile a window using subranges of the current desktop
    SysGet workarea_, MonitorWorkArea

    workarea_width  :=  workarea_Right - workarea_Left
    workarea_height := workarea_Bottom - workarea_Top

    width  := (x_stop - x_start) * workarea_width
    height := (y_stop - y_start) * workarea_height

    x := workarea_Left + (x_start * workarea_width)
    y :=  workarea_Top + (y_start * workarea_height)

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
run_last_command(f1_id)
return

^F2::
run_last_command(f2_id)
return

^F3::
run_last_command(f3_id)
return


; Grid is a 3x2 matrix:
; f4 | f5 | f6
; f1 | f2 | f3

^F4::
tile(f1_id,    0, 0.33, 0.5,   1)
tile(f2_id, 0.33, 0.66, 0.5,   1)
tile(f3_id, 0.66, 1.00, 0.5,   1)
tile(f4_id,    0, 0.33,   0, 0.5)
tile(f5_id, 0.33, 0.66,   0, 0.5)
tile(f6_id, 0.66, 1.00,   0, 0.5)
return

#z::
WinExist("ahk_class Shell_TrayWnd")
	t := !t

	If (t = "1") {
		WinHide, ahk_class Shell_TrayWnd
		WinHide, Start ahk_class Button
	} Else {
		WinShow, ahk_class Shell_TrayWnd
		WinShow, Start ahk_class Button
	}
return