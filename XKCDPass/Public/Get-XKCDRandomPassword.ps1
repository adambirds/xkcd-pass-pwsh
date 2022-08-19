Function Get-XKCDRandomPassword {
<#
.SYNOPSIS
    Creates a random password using an XKCD style password.

.DESCRIPTION
    Creates a random password using an XKCD style password which
    is a combination of memorable words making for an easier
    password to remember but harder to crack by brute force than
    a simple random password. The password by default will also include
    a two digit random number at the end of the password. It also supports
    seperating the words with a rnadom special character allowing you to
    meet many modern password requirements.

.PARAMETER NumWords
    The number of words to use in the password.

    Default: 4
    Minimum: 1

.PARAMETER NumDigits
    The number of digits to use in the password.

    Default: 2
    Minimum: 2

.PARAMETER MinWordLength
    The minimum number of characters to use for each word.

    Default: 5
    Minimum: 4

    If the value is greater than MaxWordLength then the value will be set to MaxWordLength.

.PARAMETER MaxWordLength
    The maximum number of characters to use for each word.

    Default: 9
    Minimum: 4

    If the value is less than the MinWordLength then the value will be set to the MinWordLength.

.PARAMETER Separator
    The special character to use to seperate the words in the password.

    Default: None

.PARAMETER Suffix
    The special character(s) or string to use to suffix the password.

    Default: None

.EXAMPLE
    Get-XKCDRandomPassword

.EXAMPLE
    Get-XKCDRandomPassword -NumWords 4 -NumDigits 3 -MinWordLength 4 -MaxWordLength 6 -Separator _ -Suffix !

.NOTES
    Author: Adam Birds
    Website: https://adbwebdesigns.co.uk
#>

    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false)]
        [int]$NumWords = 4,
        [Parameter(Mandatory = $false)]
        [int]$NumDigits = 2,
        [Parameter(Mandatory = $false)]
        [int]$MinWordLength = 5,
        [Parameter(Mandatory = $false)]
        [int]$MaxWordLength = 9,
        [Parameter(Mandatory = $false)]
        [string]$Separator = "",
        [Parameter(Mandatory = $false)]
        [string]$Suffix = ""
    )

    PROCESS {
        $Words = Get-RandomWordsFromWordList -WordListFilePath $PSScriptRoot\..\Static\wordlist.txt -NumberOfWords $NumWords -MinWordLength $MinWordLength -MaxWordLength $MaxWordLength
        [string]$Password = ""
        ForEach ($Word in $Words) {
            $Password += (Get-Culture).TextInfo.ToTitleCase($Word)
            If ($Separator -ne "") {
                $Password += $Separator
            }
        }

        For ($i = 0; $i -lt $NumDigits; $i++) {
            $Password += Get-Random -Min 0 -Maximum 9
        }

        If ($Suffix -ne "") {
            $Password += $Suffix
        }

        Return $Password
    }
}