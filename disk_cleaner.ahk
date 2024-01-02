; disk_cleaner.ahk

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Define the disk locations to be cleaned
diskLocations := Object()

; Function to add a new disk location to be cleaned
AddDiskLocation(locationName, locationPath) {
    global diskLocations
    diskLocations[locationName] := locationPath
}

; Function to remove a disk location from cleaning list
RemoveDiskLocation(locationName) {
    global diskLocations
    diskLocations.Delete(locationName)
}

; Function to clean disk locations
CleanDiskLocations() {
    global diskLocations
    for locationName, locationPath in diskLocations {
        ; Clean the disk location
        FileDelete, % locationPath "\*.*"
        MsgBox, % "Disk Location Cleaned: " locationPath
    }
}

; Example usage:
; AddDiskLocation("TempFiles", "C:\Windows\Temp")
; CleanDiskLocations()
