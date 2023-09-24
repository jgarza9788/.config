C:\Users\JGarza\GitHub\.config\powershell\user_profile.ps1


Function files.txt_function
{
    cmd /u /c "dir /s /b >files.txt"
}

function ezsearch {
    param (
        [string]$SearchString
    )

    $SearchString = "*$SearchString*"

    Get-ChildItem -s -Filter $SearchString | Select-Object -Property FullName
}


function TBP_search {
    param (
        [string]$SearchString,
        [string]$subfolder="",
        [bool]$FileOnly=$true
    )

    Write-Host "**this will take a moment**"

    $SearchString = "*$SearchString*"

    if ($FileOnly)
    {
        Get-ChildItem -Path "\\Theblackpearl\d\Torrents\$subfolder" -s -File -Filter $SearchString | Select-Object -Property FullName
    }
    else
    {
        Get-ChildItem -Path "\\Theblackpearl\d\Torrents\$subfolder" -s -Filter $SearchString | Select-Object -Property FullName
    }
        
}


# Alias
Set-Alias -Name run -Value start
Set-Alias -Name open -Value start
# Set-Alias -Name start -Value start
Set-Alias -Name ll -Value Get-ChildItem
Set-Alias -Name g -Value git
Set-Alias -Name grep -Value findstr
Set-Alias -Name tig -Value 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias -Name less -Value 'C:\Program Files\Git\usr\bin\less.exe'
Set-Alias -Name files.txt -Value 'files.txt_function'
Set-Alias -Name EZS -Value ezsearch
Set-Alias -Name TBP -Value TBP_search
Set-Alias -Name winfetch -Value 'C:\tools\winfetch\winfetch.ps1'


#  cd to folder
# cd C:\users\JGarza\github\


# # Import the Chocolatey Profile that contains the necessary code to enable
# # tab-completions to function for `choco`.
# # Be aware that if you are missing these lines from your profile, tab completion
# # for `choco` will not function.
# # See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}Import-Module PSReadLine
Set-PSReadLineKeyHandler -Chord Tab -Function MenuComplete
$scriptblock = {
    param($wordToComplete, $commandAst, $cursorPosition)
    $Env:_YABUS_TYPER.PY_COMPLETE = "complete_powershell"
    $Env:_TYPER_COMPLETE_ARGS = $commandAst.ToString()
    $Env:_TYPER_COMPLETE_WORD_TO_COMPLETE = $wordToComplete
    YABUS_typer.py | ForEach-Object {
        $commandArray = $_ -Split ":::"
        $command = $commandArray[0]
        $helpString = $commandArray[1]
        [System.Management.Automation.CompletionResult]::new(
            $command, $command, 'ParameterValue', $helpString)
    }
    $Env:_YABUS_TYPER.PY_COMPLETE = ""
    $Env:_TYPER_COMPLETE_ARGS = ""
    $Env:_TYPER_COMPLETE_WORD_TO_COMPLETE = ""
}
Register-ArgumentCompleter -Native -CommandName YABUS_typer.py -ScriptBlock $scriptblock
