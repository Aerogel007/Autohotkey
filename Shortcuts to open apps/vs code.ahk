#Requires AutoHotkey v2
#SingleInstance Force


; Define the hotkey Alt + c
!c:: {
    ; Check if Vscode is already open. you can find ahk class using windows spy
    if WinExist("ahk_class Chrome_WidgetWin_1 ahk_exe Code.exe") {
        ; If it is, activate it
        WinActivate
    } else {
        ; If it isn't, run Microsoft Vs code
        Run("C:\Users\Kiran\AppData\Local\Programs\Microsoft VS Code\code.exe")
    }
}
