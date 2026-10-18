# Remove-Whitespace
Simple Powershell script to remove excess whitespace and newline characters. 

Remove-Whitespace gathers a list of files in a single directory provided when calling the script. Each file in the directory is then read into memory one at a time to have two or more consecutive whitespace characters (tab, space, vertical tab, formfeed) and three or more consecutive new line characters (carriage return, newline). The trimmed file is then written to a new file, stored in a "trimmed" subdirectory of the original directory, with the original filename.

> [!NOTE]
> This script is intended to run on plain text or HTML files. It is not intended to serve as a prettifier or to be used with more complex documents such as docx Word documents.

## Examples
### Input text
>                             [Illustration:
>
>                             GEORGE ALLEN
>                               PUBLISHER
>
>                        156 CHARING CROSS ROAD
>                                LONDON
>
>                             RUSKIN HOUSE
>                                   ]
>
>                            [Illustration:
>
>               _Reading Jane’s Letters._      _Chap 34._
>                                   ]
>
>
>
>
>                                PRIDE.
>                                  and
>                               PREJUDICE
>
>                                  by
>                             Jane Austen,
>
>                           with a Preface by
>                           George Saintsbury
>                                  and
>                           Illustrations by
>                             Hugh Thomson
>
>                         [Illustration: 1894]
>
>                       Ruskin       156. Charing
>                       House.        Cross Road.
>
>                                London
>                             George Allen.
>
>
>
>

### Output text
>  [Illustration:
>
> GEORGE ALLEN
> PUBLISHER
>
>  156 CHARING CROSS ROAD
> LONDON
>
> RUSKIN HOUSE
> ]
>
> [Illustration:
>
> _Reading Jane’s Letters._ _Chap 34._
> ]
> PRIDE.
> and
> PREJUDICE
>
> by
> Jane Austen,
>
> with a Preface by
> George Saintsbury
> and
> Illustrations by
> Hugh Thomson
>
> [Illustration: 1894]
>
> Ruskin 156. Charing
> House. Cross Road.
>
> London
> George Allen.

The original files are only read. Changes happen in memory before being written to disk. No changes to the original files takes place. Files are not overwritten because they are placed in a separate directory.

### Installation
To install this script using Powershell 5.2, place the .psm1 file in the directory 

`$HOME\Documents\WindowsPowerShell\Modules\Remove-Whitespace`

> [!TIP]
> Create the directory if it does not exist.

When Powershell is opened again, the module will automatically be included as an available module. 

If the module errors with ExecutionPolicy restrictions, run

`Set-ExecutionPolicy RemoteSigned`

> [!CAUTION]
> This sets the execution policy for the LocalMachine to requiring that scripts downloaded from the internet be signed by a trusted provider.

This module contains full Powershell help information accessible by running the command `Get-Help Remove-Whitespace`
