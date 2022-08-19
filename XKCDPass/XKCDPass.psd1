@{
    RootModule = 'XKCDPass.psm1'
    ModuleVersion = '1.0.0'
    # CompatiblePSEditions = @()
    GUID = 'b35827fe-7ce3-4156-a19e-b97fc7338b55'
    Author = 'Adam Birds'
    CompanyName = 'ADB Web Designs'
    Copyright = '(c) Adam Birds. All rights reserved.'
    Description = 'Module for generating random passwords in XKCD style.'
    PowerShellVersion = '5.1'
    # RequiredModules = @()
    # RequiredAssemblies = @()
    # ScriptsToProcess = @()
    # TypesToProcess = @()
    # FormatsToProcess = @()
    # NestedModules = @()
    FunctionsToExport = @(
        'Get-XKCDRandomPassword'
    )
    CmdletsToExport = @()
    AliasesToExport = @()
    FileList = @('Static/wordlist.txt')
    PrivateData = @{
        PSData = @{
            Tags = @(
                'PasswordGenerators',
                'XKCD'
            )
            LicenseUri = 'https://github.com/adambirds/xkcd-pass-pwsh/blob/main/LICENSE'
            ProjectUri = 'https://github.com/adambirds/xkcd-pass-pwsh'
            IconUri = 'https://adbwebdesigns.co.uk/wp-content/uploads/2021/10/adb-web-designs-logo.png'
            ReleaseNotes = '
# 1.0.0

* Initial release.
            '
        }
    }
    HelpInfoURI = 'https://github.com/adambirds/xkcd-pass-pwsh'
}