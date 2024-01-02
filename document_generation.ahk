; document_generation.ahk

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Define the document templates
docTemplates := Object()

; Function to add a new document template
AddDocTemplate(templateName, templatePath) {
    global docTemplates
    docTemplates[templateName] := templatePath
}

; Function to remove a document template
RemoveDocTemplate(templateName) {
    global docTemplates
    docTemplates.Delete(templateName)
}

; Function to generate a document from a template
GenerateDocument(templateName, data, outputPath) {
    global docTemplates
    templatePath := docTemplates[templateName]
    if (!FileExist(templatePath)) {
        ; Template file does not exist
        return "Error: Template file does not exist."
    }

    ; Read the template file
    FileRead, template, % templatePath

    ; Replace placeholders in the template with data
    for key, value in data {
        template := StrReplace(template, "{" . key . "}", value)
    }

    ; Write the generated document to the output path
    FileDelete, % outputPath
    FileAppend, % template, % outputPath

    return outputPath
}

; Main loop
Loop {
    ; Generate documents from templates
    for templateName, templatePath in docTemplates {
        ; Get the data for the document
        ; This is a placeholder and should be replaced with actual data extraction logic
        data := Object()
        data["date"] := A_Now
        data["user"] := A_UserName

        ; Generate the document
        outputPath := A_ScriptDir . "\" . templateName . "_" . A_Now . ".txt"
        result := GenerateDocument(templateName, data, outputPath)
        if (SubStr(result, 1, 5) == "Error") {
            ; An error occurred
            MsgBox, % result
        } else {
            ; The document was generated successfully
            MsgBox, Document generated: % result
        }
    }

    ; Wait for 1 second
    Sleep, 1000
}
