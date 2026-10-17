function Remove-Whitespace {
<# 

.Synopsis

Remove excess duplicate new line and whitespace characters from files in a single directory while keeping original 

files intact.



.Description

Remove-Whitespace gathers a list of files in a single directory provided when calling the script. Each file in the 

directory is then read into memory one at a time to have two or more consecutive whitespace characters (tab, 

space, vertical tab, formfeed) and three or more consecutive new line characters (carriage return, newline).

The trimmed file is then written to a new file, stored in a "trimmed" subdirectory of the original directory, 

with the original filename.

The original files are only read. Changes happen in memory before being written to disk. No changes to the original 

files takes place.



.Parameter <ImportDir>

The specific directory containing the files to be trimmed.

 

.Inputs

You can enter the import directory as a plain text command line entry upon calling the script. Calling the script 

from inside a directory will run the script on that directory.

 

.Outputs

Output is written to a file in the \trimmed subdirectory of the directory containing the files. The file retains the

original file name.

 

.Example

Run the command after navigating into the directory containing the files

Remove-Whitespace 



#>
[CmdletBinding()]
param (
[string]$ImportDir=""
)

try
{
#list files in the directory, whether entered or implied
$files = ls $ImportDir

#iterate through all files in the import directory
foreach($file in $files)
{
    if (-not (Test-Path $file))
    {
        throw "Source file does not exist: $file"
    }
    #read contents of the working file
    $workingFile = (Get-Content $file -Raw).Trim()

    #grab the working directory
    $tempDir = (Get-Item -Path $file).DirectoryName
    if (-not (Test-Path $tempDir))
    {
        throw "Directory does not exist: $tempDir"
    }

    Write-Host "Removing duplicate new lines and white space from $file"

    #replace 3 or more newline characters in a row
    $newlineFile = $($workingFile -replace '(\r?\n){3,}',"`n")
    #replace 2 or more whitespace characters in a row
    $finalFile = $($newlineFile -replace '[\t\f\cK ]{2,}'," ")
        
    #create final directory
    $finalDir = $tempDir + "\trimmed"
    [void](New-Item -ItemType Directory -Force -Path $finalDir)

    #create final form of the trimmed file
    $final = "$finalDir\$file"
    Set-Content -Path $final -Value $finalFile

    Write-Host "File trimmed and saved: $final"

}
}
catch 
{
    Write-Host "Please run script in the directory containing the files required."
    exit
}
}