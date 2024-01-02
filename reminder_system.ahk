; reminder_system.ahk

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Define the reminders
reminders := Object()

; Function to add a new reminder
AddReminder(reminderName, reminderTime, reminderMessage) {
    global reminders
    reminders[reminderName] := {Time: reminderTime, Message: reminderMessage}
}

; Function to remove a reminder
RemoveReminder(reminderName) {
    global reminders
    reminders.Delete(reminderName)
}

; Function to execute reminders
ExecuteReminders() {
    global reminders
    for reminderName, reminder in reminders {
        if (A_Now == reminder.Time) {
            ; Show the reminder message
            MsgBox, % reminder.Message
        }
    }
}

; Main loop
Loop {
    ; Execute reminders
    ExecuteReminders()

    ; Wait for 1 second
    Sleep, 1000
}
