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
}