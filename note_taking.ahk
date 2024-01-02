; note_taking.ahk

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Define the notes
notes := Object()

; Function to add a new note
AddNote(noteName, noteContent) {
    global notes
    notes[noteName] := noteContent
}

; Function to remove a note
RemoveNote(noteName) {
    global notes
    notes.Delete(noteName)
}

; Function to get a note
GetNote(noteName) {
    global notes
    if (notes.HasKey(noteName)) {
        return notes[noteName]
    } else {
        return "Note not found."
    }
}

; Function to list all notes
ListNotes() {
    global notes
    noteList := ""
    for noteName, noteContent in notes {
        noteList .= noteName . ": " . noteContent . "`n"
    }
    return noteList
}

; Function to edit a note
EditNote(noteName, newContent) {
    global notes
    if (notes.HasKey(noteName)) {
        notes[noteName] := newContent
        return "Note updated successfully."
    } else {
        return "Note not found."
    }
}

; Function to clear all notes
ClearNotes() {
    global notes
    notes := Object()
    return "All notes cleared."
}
