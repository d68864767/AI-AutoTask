; image_processing.ahk

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Define the image tasks to be processed
imageTasks := Object()

; Function to add a new image task
AddImageTask(taskName, taskPath, taskAction) {
    global imageTasks
    imageTasks[taskName] := {Path: taskPath, Action: taskAction}
}

; Function to remove an image task
RemoveImageTask(taskName) {
    global imageTasks
    imageTasks.Delete(taskName)
}

; Function to execute an image task
ExecuteImageTask(taskName) {
    global imageTasks
    task := imageTasks[taskName]
    if (task) {
        Run, %task.Action% %task.Path%
    }
}

; Main loop
Loop {
    ; Execute each image task
    for taskName, task in imageTasks {
        ExecuteImageTask(taskName)
        Sleep, 1000  ; Wait for 1 second
    }
}
