; PDF_conversion.ahk

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Define the files to be converted
conversionFiles := Object()

; Function to add a new file to be converted
AddConversionFile(fileName, filePath, outputFormat) {
    global conversionFiles
    conversionFiles[fileName] := {FilePath: filePath, OutputFormat: outputFormat}
}

; Function to remove a file from conversion list
RemoveConversionFile(fileName) {
    global conversionFiles
    conversionFiles.Delete(fileName)
}

; Function to convert a file
ConvertFile(fileName) {
    global conversionFiles
    fileDetails := conversionFiles[fileName]
    if (!FileExist(fileDetails.FilePath)) {
        ; File does not exist
        return "Error: File does not exist."
    }

    ; Check if the output format is PDF
    if (fileDetails.OutputFormat != "PDF") {
        ; Unsupported format
        return "Error: Unsupported format."
    }

    ; Convert the file to PDF
    ; Note: This is a placeholder. Actual conversion will depend on the specific method or library used.
    ; For example, you might use a command-line tool like Pandoc or a COM object like Word.Application.
    ; This is just a basic example and might not work in all situations.
    Run, % "convert " . fileDetails.FilePath . " " . fileDetails.FilePath . ".pdf"

    ; Return the path of the converted file
    return fileDetails.FilePath . ".pdf"
}
