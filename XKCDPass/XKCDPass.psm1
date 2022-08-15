# Dot source all functions in all ps1 files located in the module's public and private folders, excluding tests and profiles.
$Functions = Get-ChildItem -Path $PSScriptRoot\public\*.ps1, $PSScriptRoot\private\*.ps1 -Exclude *.tests.ps1, *profile.ps1 -ErrorAction SilentlyContinue

ForEach ($Function in $Functions) {
    . $Function.FullName
}

Export-ModuleMember -Function New-XKCDRandomPassword