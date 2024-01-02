; text_expansion.ahk

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Define the text snippets to be expanded
textSnippets := Object()

; Function to add a new text snippet
AddTextSnippet(snippetName, snippetValue) {
    global textSnippets
    textSnippets[snippetName] := snippetValue
}

; Function to remove a text snippet
RemoveTextSnippet(snippetName) {
    global textSnippets
    textSnippets.Delete(snippetName)
}

; Function to get a text snippet
GetTextSnippet(snippetName) {
    global textSnippets
    return textSnippets[snippetName]
}

; Function to expand a text snippet
ExpandTextSnippet(snippetName) {
    global textSnippets
    SendInput, %textSnippets[snippetName]%
}

; Hotkey to expand text snippet
#IfWinActive
^!e::  ; Ctrl + Alt + e
InputBox, snippetName, Text Expansion, Enter the name of the text snippet to expand:
if (snippetName != "") {
    ExpandTextSnippet(snippetName)
}
return
