# XKCDPass PowerShell Module

[![test-and-publish](https://github.com/adambirds/xkcd-pass-pwsh/actions/workflows/test-and-publish.yml/badge.svg?branch=main)](https://github.com/adambirds/xkcd-pass-pwsh/actions/workflows/test-and-publish.yml)
[![codecov](https://codecov.io/gh/adambirds/xkcd-pass-pwsh/branch/main/graph/badge.svg?token=XQGNSR1A57)](https://codecov.io/gh/adambirds/xkcd-pass-pwsh)
[![GitHub release](https://img.shields.io/github/release/adambirds/xkcd-pass-pwsh.svg)](https://github.com/adambirds/xkcd-pass=pwsh/releases/latest)
[![PowerShell Gallery](https://img.shields.io/powershellgallery/dt/XKCDPass?style=plastic)](https://www.powershellgallery.com/packages/XKCDPass)
![GitHub stars](https://img.shields.io/github/stars/adambirds/xkcd-pass-pwsh.svg)
![GitHub watchers](https://img.shields.io/github/watchers/adambirds/xkcd-pass-pwsh.svg)
![GitHub forks](https://img.shields.io/github/forks/adambirds/xkcd-pass-pwsh.svg)
![GitHub issues](https://img.shields.io/github/issues/adambirds/xkcd-pass-pwsh.svg)
![GitHub contributors](https://img.shields.io/github/contributors/adambirds/xkcd-pass-pwsh.svg)
![License](https://img.shields.io/github/license/adambirds/xkcd-pass-pwsh.svg)
![GitHub Sponsors](https://img.shields.io/github/sponsors/adambirds)

XKCDPass is a PowerShell module that provides a flexible and scriptable password generator which generates strong passphrases, inspired by [XKCD 936][xkcd].

The command which is exported from this module is `Get-XKCDRandomPassword`.

Whilst this password generator is inspired by [XKCD 936][xkcd], its defaults have been configured in a way which gives this tool the most compatibility out of the box with the majority of services we use passwords for today. The defaults that we have set are:
* The password contains 4 words between 5 and 9 characters.
* The first letter of each word is capitalized.
* The passphrase is ended with two random digits.

This allows the password generator to provide passwords by default which will be strong, easy to remember, difficult to brute-force and still pass the usual requirements of at least one upper-case letter, one lower-case letter and at least 1 digit.

[xkcd]: https://xkcd.com/936/
![](https://imgs.xkcd.com/comics/password_strength.png)

## Support
For support using this bot, please join our [official support server](https://discord.gg/f5veJaa4ZX) on [Discord](https://discord.com).

[![discord](https://img.shields.io/discord/941885906443468880?color=%237289DA&label=Coding%20And%20Gaming%20With%20Adam&logo=discord&logoColor=white)](https://discord.gg/f5veJaa4ZX)

## Source
The source code can be found [here](https://github.com/adambirds/xkcd-pass-pwsh).

## Requirements

* PowerShell 5.1 or Above.

This module will work cross-platform with PowerShell 7.

## Installation

```powershell
Install-Module -Name XKCDPass
```

## Usage

To generate a password using the defaukt settings, run the following command:

```powershell
Get-XKCDRandomPassword
```

We also support the following parameters:

* `-NumWords`: The number of words to include in the password.
* `-NumDigits`: The number of digits to include in the password.
* `-MinWordLength`: The minimum length of a word to include in the password.
* `-MaxWordLength`: The maximum length of a word to include in the password.
* `-Seperator`: The seperator to use between words in the password.
* `-Suffix`: The suffix to use at the end of the password.

An example using the above parameters can be found below:

```powershell
Get-XKCDRandomPassword -NumWords 4 -NumDigits 3 -MinWordLength 4 -MaxWordLength 6 -Separator _ -Suffix !
```

## License

This project is released under the [GNU GENERAL PUBLIC LICENSE v3](https://github.com/adambirds/xkcd-pass-pwsh/blob/main/LICENSE).