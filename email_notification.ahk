; email_notification.ahk

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Define the email notifications
emailNotifications := Object()

; Function to add a new email notification
AddEmailNotification(notificationName, notificationCriteria, notificationAction) {
    global emailNotifications
    emailNotifications[notificationName] := {Criteria: notificationCriteria, Action: notificationAction}
}

; Function to remove an email notification
RemoveEmailNotification(notificationName) {
    global emailNotifications
    emailNotifications.Delete(notificationName)
}

; Function to check emails for notifications
CheckEmailNotifications(emails) {
    global emailNotifications
    for notificationName, notification in emailNotifications {
        for index, email in emails {
            if (email.Subject contains notification.Criteria.Subject && email.Body contains notification.Criteria.Body) {
                ; Execute the notification action
                notification.Action(email)
            }
        }
    }
}

; Main loop
Loop {
    ; Fetch emails
    emails := FetchEmails()
    
    ; Check emails for notifications
    CheckEmailNotifications(emails)
    
    ; Wait for a while before checking again
    Sleep, 60000  ; Wait for 1 minute
}
