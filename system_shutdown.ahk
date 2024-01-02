; system_shutdown.ahk

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Define the shutdown time
shutdownTime := ""

; Function to set the shutdown time
SetShutdownTime(time) {
    global shutdownTime
    shutdownTime := time
}

; Function to cancel the scheduled shutdown
CancelShutdown() {
    global shutdownTime
    shutdownTime := ""
}

; Function to shutdown the system
ShutdownSystem() {
    global shutdownTime
    if (A_Now == shutdownTime) {
        ; Shutdown the system
        Shutdown, 1
    }
}

; Main loop
Loop {
    ; Shutdown the system
    ShutdownSystem()

    ; Wait for 1 second
    Sleep, 1000
}
