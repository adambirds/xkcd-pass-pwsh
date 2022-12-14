Function Get-RandomWordsFromWordList {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSReviewUnusedParameter', 'MinWordLength', Justification = 'False positive as rule does not scan child scopes')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSReviewUnusedParameter', 'MaxWordLength', Justification = 'False positive as rule does not scan child scopes')]
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true, Position=0)]
        [string]$WordListFilePath,
        [Parameter(Mandatory=$true, Position=1)]
        [int]$NumberOfWords,
        [Parameter(Mandatory=$true, Position=2)]
        [int]$MinWordLength,
        [Parameter(Mandatory=$true, Position=3)]
        [int]$MaxWordLength
    )

    PROCESS {
        [string[]]$WordList = Get-Content $WordListFilePath;
        $WordList = $WordList | Where-Object {$_.Length -ge $MinWordLength -and $_.Length -le $MaxWordLength};
        [string[]]$SelectedWords = $WordList | Get-Random -Count $NumberOfWords;

        Return $SelectedWords;
    }
}