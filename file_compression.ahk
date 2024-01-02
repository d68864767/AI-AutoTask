; file_compression.ahk

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Define the files to be compressed
compressionFiles := Object()

; Function to add a new file to be compressed
AddCompressionFile(fileName, filePath, compressionPath) {
    global compressionFiles
    compressionFiles[fileName] := {FilePath: filePath, CompressionPath: compressionPath}
}

; Function to remove a file from compression list
RemoveCompressionFile(fileName) {
    global compressionFiles
    compressionFiles.Delete(fileName)
}

; Function to compress files
CompressFiles() {
    global compressionFiles
    for fileName, file in compressionFiles {
        ; Compress the file
        ; This is a placeholder, replace with actual compression command
        Compress(file.FilePath, file.CompressionPath)
    }
}

; Main loop
Loop {
    ; Compress files
    CompressFiles()
    ; Wait for a while before the next compression
    Sleep, 60000  ; Sleep for 1 minute
}

; Function to compress a file
Compress(filePath, compressionPath) {
    ; This is a placeholder, replace with actual compression command
    ; For example, you can use 7-Zip command line version to compress files
    ; Run, 7z a "%compressionPath%" "%filePath%"
}
