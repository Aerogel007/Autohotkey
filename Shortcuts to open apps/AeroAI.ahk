#Requires AutoHotkey v2
#SingleInstance Force


; Define the hotkey Alt + A
!a:: {
        ;we can direclty run AeroAi because it only runs one instance.
        ;and if one instance is already running. executing .exe will open the window of that instance
        Run("C:\apps\Apps made by me\AeroAI\Aero.exe")
}
