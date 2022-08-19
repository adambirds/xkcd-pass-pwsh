$Module = "XKCDPass"

Describe "$Module Module Tests" {
    BeforeAll {
        $ModulePath = Split-Path -Parent $PSScriptRoot
        Write-Output $ModulePath
        $Module = "XKCDPass"
        Write-Output $Module
    }

    Context "Module Setup" {
        
        It "Has the root module $Module.psm1" {
            ("{0}\{1}.psm1" -f $ModulePath, $Module) | Should -Exist
        }

        It "Has the manifest file $Module.psd1" {
            ("{0}\{1}.psd1" -f $ModulePath, $Module) | Should -Exist
        }

        It "Public folder has the public function Get-XKCDRandomPassword.ps1" {
            ("{0}\Public\Get-XKCDRandomPassword.ps1" -f $ModulePath) | Should -Exist
        }

        It "Private folder has the private function Get-RandomWordsFromWordList.ps1" {
            ("{0}\Private\Get-RandomWordsFromWordList.ps1" -f $ModulePath) | Should -Exist
        }

        It "Check module $Module.psm1 should be valid code" {
            $File = Get-Content -Path ("{0}\{1}.psm1" -f $ModulePath, $Module) -ErrorAction Stop
            $Errors = $null
            $null = [System.Management.Automation.PSParser]::Tokenize($File, [ref]$Errors)
            $Errors.Count | Should -Be 0
        }
    }

    $PublicFunctions = @(
        "Get-XKCDRandomPassword"
    )

    Context "Testing Public Function <$_>.ps1" -ForEach $PublicFunctions {
        It "Function $_.ps1 should exist" {
            ("{0}\Public\{1}.ps1" -f $ModulePath, $_) | Should -Exist
        }

        It "Function $_.ps1 should have help block" {
            ("{0}\Public\{1}.ps1" -f $ModulePath, $_) | Should -FileContentMatch '<#'
            ("{0}\Public\{1}.ps1" -f $ModulePath, $_) | Should -FileContentMatch '#>'
        }

        It "Function $_.ps1 should have a SYNOPSIS section in the help block" {
            ("{0}\Public\{1}.ps1" -f $ModulePath, $_) | Should -FileContentMatch '.SYNOPSIS'
        }

        It "Function $_.ps1 should have a DESCRIPTION section in the help block" {
            ("{0}\Public\{1}.ps1" -f $ModulePath, $_) | Should -FileContentMatch '.DESCRIPTION'
        }

        It "Function $_.ps1 should have a PARAMETER section in the help block" {
            ("{0}\Public\{1}.ps1" -f $ModulePath, $_) | Should -FileContentMatch '.PARAMETER'
        }

        It "Function $_.ps1 should have a EXAMPLE section in the help block" {
            ("{0}\Public\{1}.ps1" -f $ModulePath, $_) | Should -FileContentMatch '.EXAMPLE'
        }

        It "Function $_.ps1 should have be an advanced function" {
            ("{0}\Public\{1}.ps1" -f $ModulePath, $_) | Should -FileContentMatch 'CmdletBinding'
            ("{0}\Public\{1}.ps1" -f $ModulePath, $_) | Should -FileContentMatch 'Function'
            ("{0}\Public\{1}.ps1" -f $ModulePath, $_) | Should -FileContentMatch 'Param'
        }

        It "Function $_.ps1 should be valid code" {
            $File = Get-Content -Path ("{0}\Public\{1}.ps1" -f $ModulePath, $_) -ErrorAction Stop
            $Errors = $null
            $null = [System.Management.Automation.PSParser]::Tokenize($File, [ref]$Errors)
            $Errors.Count | Should -Be 0
        }
    }
}