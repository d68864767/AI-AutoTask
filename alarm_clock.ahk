; alarm_clock.ahk

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Define the alarms
alarms := Object()

; Function to add a new alarm
AddAlarm(alarmName, alarmTime, alarmSound) {
    global alarms
    alarms[alarmName] := {Time: alarmTime, Sound: alarmSound}
}

; Function to remove an alarm
RemoveAlarm(alarmName) {
    global alarms
    alarms.Delete(alarmName)
}

; Function to execute alarms
ExecuteAlarms() {
    global alarms
    for alarmName, alarm in alarms {
        if (A_Now == alarm.Time) {
            ; Play the alarm sound
            SoundPlay, %alarm.Sound%
        }
    }
}

; Main loop
Loop {
    ; Execute alarms
    ExecuteAlarms()
    ; Sleep for a second to prevent high CPU usage
    Sleep, 1000
}
