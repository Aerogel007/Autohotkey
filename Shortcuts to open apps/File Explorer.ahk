#Requires AutoHotkey v2
#SingleInstance Force


#e:: {
    ; Check if File Explorer is already open
    if WinExist("ahk_class CabinetWClass") {
        ; If it is, activate it
        WinActivate
    } else {
        ; If it isn't, run File Explorer
        Run("explorer.exe")
    }
}
