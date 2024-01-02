; text_conversion.ahk

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Define the text formats
textFormats := Object()

; Function to add a new text format
AddTextFormat(formatName, formatType) {
    global textFormats
    textFormats[formatName] := formatType
}

; Function to remove a text format
RemoveTextFormat(formatName) {
    global textFormats
    textFormats.Delete(formatName)
}

; Function to convert text from one format to another
ConvertText(formatName, text) {
    global textFormats
    formatType := textFormats[formatName]
    if (formatType == "uppercase") {
        ; Convert text to uppercase
        return StrUpper(text)
    } else if (formatType == "lowercase") {
        ; Convert text to lowercase
        return StrLower(text)
    } else if (formatType == "titlecase") {
        ; Convert text to title case
        return StrReplace(RegExReplace(text, "i)\\b([a-z])", "$u1"), "_", " ")
    } else {
        ; Unsupported text format type
        return "Error: Unsupported text format type."
    }
}

; Main loop
Loop {
    ; Convert text from sources
    for formatName, formatType in textFormats {
        ; Here you can add the text you want to convert
        text := "your text here"
        convertedText := ConvertText(formatName, text)
        ; Process the converted text
        ; ...
    }

    ; Wait for 1 second
    Sleep, 1000
}
