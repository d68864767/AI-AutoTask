; clipboard_manager.ahk

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Define the clipboard contents
clipboardContents := Object()

; Function to add a new clipboard content
AddClipboardContent(contentName, contentValue) {
    global clipboardContents
    clipboardContents[contentName] := contentValue
}

; Function to remove a clipboard content
RemoveClipboardContent(contentName) {
    global clipboardContents
    clipboardContents.Delete(contentName)
}

; Function to get a clipboard content
GetClipboardContent(contentName) {
    global clipboardContents
    return clipboardContents[contentName]
}

; Function to set a clipboard content
SetClipboardContent(contentName) {
    global clipboardContents
    Clipboard := clipboardContents[contentName]
}

; Function to clear the clipboard
ClearClipboard() {
    Clipboard := ""
}

; Main loop
Loop {
    ; Check for clipboard changes
    if (Clipboard != clipboardContents["current"]) {
        ; Update the current clipboard content
        clipboardContents["current"] := Clipboard
    }
    Sleep, 100
}
