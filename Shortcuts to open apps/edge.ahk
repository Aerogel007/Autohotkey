#Requires AutoHotkey v2
#SingleInstance Force


; Define the hotkey Alt + E
!e:: {
    ; Check if Microsoft Edge is already open
    if WinExist("ahk_class Chrome_WidgetWin_1 ahk_exe msedge.exe") {
        ; If it is, activate it
        WinActivate
    } else {
        ; If it isn't, run Microsoft Edge
        Run("msedge.exe")
    }
}
