; presentation_control.ahk

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Define the presentation tasks to be automated
presentationTasks := Object()

; Function to add a new presentation task
AddPresentationTask(taskName, taskAction) {
    global presentationTasks
    presentationTasks[taskName] := taskAction
}

; Function to remove a presentation task
RemovePresentationTask(taskName) {
    global presentationTasks
    presentationTasks.Delete(taskName)
}

; Function to execute presentation tasks
ExecutePresentationTasks() {
    global presentationTasks
    for taskName, taskAction in presentationTasks {
        ; Execute the task action
        taskAction
    }
}

; Main loop
Loop {
    ; Execute presentation tasks
    ExecutePresentationTasks()
    Sleep, 1000  ; Wait for 1 second before the next iteration
}
