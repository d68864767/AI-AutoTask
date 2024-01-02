; browser_automation.ahk

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Define the browser tasks to be automated
browserTasks := Object()

; Function to add a new browser task
AddBrowserTask(taskName, taskURL, taskAction) {
    global browserTasks
    browserTasks[taskName] := {URL: taskURL, Action: taskAction}
}

; Function to remove a browser task
RemoveBrowserTask(taskName) {
    global browserTasks
    browserTasks.Delete(taskName)
}

; Function to execute a browser task
ExecuteBrowserTask(taskName) {
    global browserTasks
    task := browserTasks[taskName]
    
    ; Open the specified URL in the default browser
    Run, % task.URL
    Sleep, 1000  ; Wait for the browser to open

    ; Execute the task action
    task.Action
}

; Main loop
Loop {
    ; Execute browser tasks
    for taskName, task in browserTasks {
        ExecuteBrowserTask(taskName)
    }

    ; Wait for 1 second
    Sleep, 1000
}
