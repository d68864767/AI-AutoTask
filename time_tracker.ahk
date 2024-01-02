; time_tracker.ahk

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Define the tasks to be tracked
tasks := Object()

; Function to start tracking a task
StartTask(taskName) {
    global tasks
    tasks[taskName] := {StartTime: A_Now, EndTime: ""}
}

; Function to stop tracking a task
StopTask(taskName) {
    global tasks
    if (tasks.HasKey(taskName) && tasks[taskName].EndTime == "") {
        tasks[taskName].EndTime := A_Now
    }
}

; Function to get the duration of a task
GetTaskDuration(taskName) {
    global tasks
    if (tasks.HasKey(taskName) && tasks[taskName].EndTime != "") {
        startTime := tasks[taskName].StartTime
        endTime := tasks[taskName].EndTime
        duration := endTime - startTime
        return duration
    }
    return 0
}

; Function to remove a task
RemoveTask(taskName) {
    global tasks
    tasks.Delete(taskName)
}

; Main loop
Loop {
    ; Wait for 1 second
    Sleep, 1000
}
