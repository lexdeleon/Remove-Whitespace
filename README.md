# Remove-Whitespace
Simple Powershell script to remove excess whitespace and newline characters. Three or more newline characters are removed, two or more newline characters.

To install this script using Powershell 5.2, place the .psm1 file in the directory 
`$HOME\Documents\WindowsPowerShell\Modules\Remove-Whitespace`
Create the directory if it does not exist.

When Powershell is opened again, the module will automatically be included as an available module. 

If the module errors with ExecutionPolicy restrictions, run
`Set-ExecutionPolicy RemoteSigned`
This sets the execution policy for the LocalMachine to requiring that scripts downloaded from the internet be signed by a trusted provider.

This module contains full Powershell help information as well.