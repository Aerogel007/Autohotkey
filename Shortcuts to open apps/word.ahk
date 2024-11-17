#Requires AutoHotkey v2
#SingleInstance Force  ; Allow only one instance of this script to run

; Define the hotkey Alt + W
!w:: {
    ; Check if Microsoft Word is already open
    if WinExist("ahk_class OpusApp") {
        ; If it is, activate it
        WinActivate
    } else {
        ; If it isn't, run Microsoft Word
        Run("WINWORD.EXE")  ; This will use the system PATH to find WINWORD.EXE
    }
}
