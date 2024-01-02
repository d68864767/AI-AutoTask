; task_scheduler.ahk

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Define the tasks to be scheduled
tasks := Object()

; Function to add a new task
AddTask(taskName, taskTime, taskAction) {
    global tasks
    tasks[taskName] := {Time: taskTime, Action: taskAction}
}

; Function to remove a task
RemoveTask(taskName) {
    global tasks
    tasks.Delete(taskName)
}

; Function to execute tasks
ExecuteTasks() {
    global tasks
    for taskName, task in tasks {
        if (A_Now == task.Time) {
            ; Execute the task action
            task.Action
        }
    }
}

; Main loop
Loop {
    ; Execute tasks
    ExecuteTasks()

    ; Wait for 1 second
    Sleep, 1000
}
