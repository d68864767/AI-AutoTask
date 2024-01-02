; project_management.ahk

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Define the projects
projects := Object()

; Function to add a new project
AddProject(projectName, projectDescription, projectDeadline) {
    global projects
    projects[projectName] := {Description: projectDescription, Deadline: projectDeadline, Tasks: Object()}
}

; Function to remove a project
RemoveProject(projectName) {
    global projects
    projects.Delete(projectName)
}

; Function to add a task to a project
AddTaskToProject(projectName, taskName, taskDescription, taskDeadline) {
    global projects
    if (projects.HasKey(projectName)) {
        projects[projectName].Tasks[taskName] := {Description: taskDescription, Deadline: taskDeadline}
    }
}

; Function to remove a task from a project
RemoveTaskFromProject(projectName, taskName) {
    global projects
    if (projects.HasKey(projectName)) {
        projects[projectName].Tasks.Delete(taskName)
    }
}

; Function to get the details of a project
GetProjectDetails(projectName) {
    global projects
    if (projects.HasKey(projectName)) {
        return projects[projectName]
    }
    return "Project not found"
}

; Function to get the details of a task in a project
GetTaskDetails(projectName, taskName) {
    global projects
    if (projects.HasKey(projectName) && projects[projectName].Tasks.HasKey(taskName)) {
        return projects[projectName].Tasks[taskName]
    }
    return "Task not found in the specified project"
}

; Main loop
Loop {
    ; Check if any project deadlines are due
    for projectName, project in projects {
        if (A_Now == project.Deadline) {
            ; Notify the user about the project deadline
            MsgBox, Project deadline due: %projectName%
        }

        ; Check if any task deadlines within the project are due
        for taskName, task in project.Tasks {
            if (A_Now == task.Deadline) {
                ; Notify the user about the task deadline
                MsgBox, Task deadline due in project %projectName%: %taskName%
            }
        }
    }
    Sleep, 1000  ; Wait for 1 second before the next iteration
}
