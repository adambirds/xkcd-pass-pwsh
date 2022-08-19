$Module = "XKCDPass"

$ModulePath = Split-Path -Parent $PSScriptRoot

Get-Module $Module | Remove-Module -Force
Import-Module $ModulePath\XKCDPass.psm1 -Force

Describe "Get-XKCDRandomPassword Module Tests" {
    Context "Testing function with default parameters" {
        BeforeAll {    
            $Password = Get-XKCDRandomPassword
            Write-Output $Password
        }

        It "Should return a password" {
            $Password | Should -Not -BeNullOrEmpty
        }

        It "Should return an alphanumeric password" {
            $Password | Should -Match '^[a-zA-Z0-9]*$'
        }

        It "Should return a password with a length greater than or equal to 22" {
            $Password.Length | Should -BeGreaterOrEqual 21
        }

        It "Should return a password with a length less than or equal to 38" {
            $Password.Length | Should -BeLessOrEqual 38
        }

        It "Should return 4 title case words between 5 and 8 letters long in the password with 2 digits on the end" {
            $Password | Should -MatchExactly "([A-Z]{1}[a-z]{4,8}){4}[0-9]{2}$"
        }
    }

    Context "Testing function with none-default parameters" {
        BeforeAll {    
            $Password = Get-XKCDRandomPassword -NumWords 5 -NumDigits 4 -MinWordLength 6 -MaxWordLength 8 -Separator "_" -Suffix "!"
            Write-Output $Password
        }

        It "Should return a password" {
            $Password | Should -Not -BeNullOrEmpty
        }

        It "Should return an alphanumeric password with underscores and exclamation points" {
            $Password | Should -Match '^[a-zA-Z0-9_!]*$'
        }

        It "Should return a password with a length greater than or equal to 40" {
            $Password.Length | Should -BeGreaterOrEqual 40
        }

        It "Should return a password with a length less than or equal to 38" {
            $Password.Length | Should -BeLessOrEqual 50
        }

        It "Should return 4 title case words between 5 and 8 letters long in the password with 2 digits on the end" {
            $Password | Should -MatchExactly "([A-Z]{1}[a-z]{5,7}[_]{1}){5}[0-9]{4}[!]{1}$"
        }
    }
}