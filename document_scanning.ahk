; document_scanning.ahk

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Define the documents to be scanned
scanDocuments := Object()

; Function to add a new document to be scanned
AddScanDocument(docName, docPath, scanAction) {
    global scanDocuments
    scanDocuments[docName] := {Path: docPath, Action: scanAction}
}

; Function to remove a document from the scan list
RemoveScanDocument(docName) {
    global scanDocuments
    scanDocuments.Delete(docName)
}

; Function to execute a document scan
ExecuteScanDocument(docName) {
    global scanDocuments
    doc := scanDocuments[docName]
    if (doc) {
        Run, %doc.Action% %doc.Path%
    }
}

; Main loop
Loop {
    ; Execute each document scan
    for docName, doc in scanDocuments {
        ExecuteScanDocument(docName)
    }
    Sleep, 1000 ; Wait for a second before the next iteration
}
