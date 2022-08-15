@{
    RootModule = 'XKCDPass.psm1'
    ModuleVersion = '0.0.4'
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
        'New-XKCDRandomPassword'
    )
    CmdletsToExport = @()
    AliasesToExport = @()
    FileList = @('Static/wordlist.txt')
    PrivateData = @{
        PSData = @{
            Tags = @(
                'Password Generators',
                'XKCD'
            )
            LicenseUri = 'https://github.com/adambirds/xkcd-pass-pwsh/blob/main/LICENSE'
            ProjectUri = 'https://github.com/adambirds/xkcd-pass-pwsh'
            IconUri = ''
            ReleaseNotes = ''
        }
    }
    HelpInfoURI = 'https://github.com/adambirds/xkcd-pass-pwsh'
}