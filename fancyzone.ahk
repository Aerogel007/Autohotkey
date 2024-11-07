/*
kiran jung shah
-----------------------------------------------------------------------
so i wrote this code to create three window multitasking workspace.
like in fancy zones.
this was really useful for me. the left window is the largest,
right two windows are of the same size. i use the left window to work on
while using the other two as references.
-------------------------------------------------------------------------
guide to use this script:
-download autohotkey v2
-copy the code below in notepad. while saving it, go to the shell:Starup directory
and save it there as .ahk file, this way the program is active in system tray 
since bootup. 
note: the hotkey used here is alt+3 you can make you own hot key by changing "!3"
in the code and this is for 1080p screen, if you have a screen with different
resolution you need to tweak the script a little.
*/

#Requires AutoHotkey v2.0+
#SingleInstance Force  ; Ensures only one instance of this script runs at a time

; Function to get the last three open window titles
GetLastThreeWindows() {
    windows := WinGetList()  ; Get a list of open windows
    titles := []  ; Initialize an array to hold window titles

    ; Iterate through the window handles from the last to the first
    for hwnd in windows {
        title := WinGetTitle(hwnd)  ; Get the title of the window
        if title != ""  ; Check if the title is not empty
            titles.Push(title)  ; Add the title to the array
        
        if titles.Length >= 3  ; Stop if we have 3 titless
            break
    }
    return titles
/*
    ; Construct a message with the last three window titles
    MsgBox("Last three open windows:`n")
    ; Enumerate all strings in the array
    for value in titles{
    MsgBox(value)
   }
*/   
}

TileWindowsInFancyZones() {
    ; Get the titles of the last three open windows
    lastThree := GetLastThreeWindows()
	
    
    ; FancyZones' grid positions based on your layout:
    ; Zone 1: 7200px width, Zone 2: 600px width, Zone 3: 60px width
    FancyZonePositions := [
        [0, 0],      ; Zone 1: Top-left corner
        [695, 0],    ; Zone 2: After Zone 1
        [1290, 0]    ; Zone 3: After Zone 2
    ]

    ; Get screen height
    screenHeight := A_ScreenHeight+10

    ; Iterate over the three windows and move them to the FancyZone positions
    for i, title in lastThree {
	width := 740
	if(i>1){
	width := 640
	}
        ; Find the window by title
        WinActivate title
	
        WinRestore title   ; Restores it to a normal state
	
        ; Move each window to the appropriate position in the FancyZones grid
        WinMove(FancyZonePositions[i][1],0 ,width ,screenHeight, title) ;
	}
}

; Hotkey to trigger the function
!3::TileWindowsInFancyZones()  ; Press Ctrl + J to get the last three windows