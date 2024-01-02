; screenshot_capture.ahk

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Function to capture a screenshot
CaptureScreenshot(fileName) {
    ; Save the screenshot to the specified file
    Send, {PrintScreen}
    Sleep, 100  ; Wait for the screenshot to be captured
    Run, mspaint
    WinWaitActive, Untitled - Paint
    Send, ^v  ; Paste the screenshot
    Sleep, 100  ; Wait for the screenshot to be pasted
    Send, ^s  ; Save the screenshot
    WinWaitActive, Save As
    Send, %fileName%{Enter}  ; Enter the file name
    Sleep, 100  ; Wait for the file name to be entered
    Send, {Enter}  ; Confirm the save
    WinWaitClose  ; Wait for the save dialog to close
    WinClose, Untitled - Paint  ; Close Paint
}

; Main loop
Loop {
    ; Capture a screenshot every 5 minutes
    CaptureScreenshot(A_Now ".png")
    Sleep, 300000  ; Wait for 5 minutes
}
