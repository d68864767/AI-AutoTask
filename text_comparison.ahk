; text_comparison.ahk

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Define the text documents to be compared
textDocs := Object()

; Function to add a new text document
AddTextDoc(docName, docPath) {
    global textDocs
    textDocs[docName] := docPath
}

; Function to remove a text document
RemoveTextDoc(docName) {
    global textDocs
    textDocs.Delete(docName)
}

; Function to compare two text documents
CompareTextDocs(docName1, docName2) {
    global textDocs
    docPath1 := textDocs[docName1]
    docPath2 := textDocs[docName2]

    ; Read the contents of the two documents
    FileRead, docContent1, %docPath1%
    FileRead, docContent2, %docPath2%

    ; Compare the contents of the two documents
    if (docContent1 == docContent2) {
        ; The contents of the two documents are identical
        return "The contents of the two documents are identical."
    } else {
        ; The contents of the two documents are different
        return "The contents of the two documents are different."
    }
}
