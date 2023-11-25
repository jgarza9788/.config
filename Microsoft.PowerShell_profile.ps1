C:\Users\JGarza\GitHub\.config\powershell\user_profile.ps1

# never truncate -- but the buffer might be too large
# $Host.UI.RawUI.BufferSize = New-Object Management.Automation.Host.Size(9999, 9999)
# $Host.UI.RawUI.BufferSize = New-Object Management.Automation.Host.Size(1200, 1200)



Function files.txt_function
{
    cmd /u /c "dir /s /b >files.txt"
}

function RegexFileSearch {
    param (
        [string]$SearchString
    )

    $DIR = Get-Location
    Write-Host "Searching folder: $DIR"
    Write-Host "**this will take a moment**"

    $files = Get-ChildItem -s | Where-Object { $_.Name -match $SearchString } 
    

    if ($files.Count -eq 0) 
    {
        Write-Host "No files found matching '$SearchString'."
    } 
    else 
    {
        Write-Host "Files found:"

        for ($i = 0; $i -lt $files.Count; $i++) 
        {
            Write-Host "$i. $($files[$i].FullName.Replace($DIR,'󰉋'))"
        }

        $N = Read-Host "Open item (input number) or 'C' to cancel"

        if ($N -eq 'C' -or $N -eq 'c') 
        {
            Write-Host "Operation canceled."
        } 
        elseif ($N -ge 0 -and $N -lt $files.Count) 
        {
            $picked_file = $files[$N]
            $picked_file
            Start-Process $picked_file.FullName  # Opens the chosen file
        } 
        else 
        {
            Write-Host "Invalid selection."
        }
    }
}

function TBP_search {
    param (
        [string]$SearchString,
        [string]$subfolder=""
    )

    Write-Host "**this will take a moment**"

    $files = Get-ChildItem -Path "\\Theblackpearl\d\Torrents\$subfolder" -s -File | Where-Object { $_.Name -match $SearchString }

    if ($files.Count -eq 0) {
        Write-Host "No files found matching '$SearchString'."
    } else {
        Write-Host "Files found:"
        
        for ($i = 0; $i -lt $files.Count; $i++) {
            Write-Host "$i. $($files[$i].Name)"
        }
        
        $N = Read-Host "Open item (input number) or 'C' to cancel"
        
        if ($N -eq 'C' -or $N -eq 'c') {
            Write-Host "Operation canceled."
        } elseif ($N -ge 0 -and $N -lt $files.Count) {
            $picked_file = $files[$N]
            $picked_file
            Start-Process $picked_file.FullName  # Opens the chosen file
        } else {
            Write-Host "Invalid selection. Please enter a valid number or 'C' to cancel."
        }
    }
}

# function TBP_live_search {
#     Write-Host "Live search is active. Start typing your search query."
#    
#     while ($true) {
#         $searchString = Read-Host "Enter search query (press Enter to exit)"
#        
#         if ([string]::IsNullOrEmpty($searchString)) {
#             Write-Host "Exiting live search."
#             break
#         }
#        
#         $files = Get-ChildItem -Path "\\Theblackpearl\d\Torrents\" -s -File | Where-Object { $_.Name -match $searchString }
#        
#         if ($files.Count -eq 0) {
#             Write-Host "No files found matching '$searchString'."
#         } else {
#             $files | Select-Object -Property Name, Directory | Out-GridView
#         }
#     }
# }

function taskman{
    Get-Process | Sort CPU -Descending | Select ProcessName, CPU, PM, WS, VM | Format-Table -AutoSize
}

function list-my-Aliases{
    Get-Content $profile | findstr "Set-Alias"
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
Set-Alias -Name RegExFS -Value RegexFileSearch
Set-Alias -Name RFS -Value RegexFileSearch
Set-Alias -Name REFS -Value RegexFileSearch
Set-Alias -Name TBP -Value TBP_search
Set-Alias -Name winfetch -Value 'C:\tools\winfetch\winfetch.ps1'
Set-Alias -Name vim -Value 'C:\Program Files\Vim\vim90\vim.exe'
Set-Alias -Name vi -Value 'C:\Program Files\Vim\vim90\vim.exe'
Set-Alias -Name mic -Value 'C:\tools\micro\micro.exe'
Set-Alias -Name micro -Value 'C:\tools\micro\micro.exe'
Set-Alias -Name lma -Value list-my-Aliases
Set-Alias -Name tm -Value taskman
Set-Alias -Name tman -Value taskman
Set-Alias -Name actpy -Value '.\env\Scripts\activate'
Set-Alias -Name activate -Value '.\env\Scripts\activate'
Set-Alias -Name env_activate -Value '.\env\Scripts\activate'

Set-Alias -Name matrix -Value 'C:\tools\rusty-rain.exe'
Set-Alias -Name neo -Value 'C:\tools\rusty-rain.exe'

# this will map my YABUS_typer.py to be quickly accessible
function fn_YABUS{
    param(
        [string[]]$Parameters
    )
    # Replace 'python_script.py' with the actual name of your Python script
    # Join the parameters into a single string separated by spaces
    $paramString = $Parameters -join ' '
    python C:\Users\JGarza\GitHub\YABUS\YABUS_typer.py $paramString
}
Set-Alias -Name YABUS -Value fn_YABUS

function fn_PwdMan{
    python C:\Users\JGarza\GitHub\PwdMan\main.py 
}
Set-Alias -Name PwdMan -Value fn_PwdMan

#  cd to folder
# cd C:\users\JGarza\github\


# # # Import the Chocolatey Profile that contains the necessary code to enable
# # # tab-completions to function for `choco`.
# # # Be aware that if you are missing these lines from your profile, tab completion
# # # for `choco` will not function.
# # # See https://ch0.co/tab-completion for details.
# $ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
# if (Test-Path($ChocolateyProfile)) {
#   Import-Module "$ChocolateyProfile"
# }Import-Module PSReadLine
# Set-PSReadLineKeyHandler -Chord Tab -Function MenuComplete
# $scriptblock = {
#     param($wordToComplete, $commandAst, $cursorPosition)
#     $Env:_YABUS_TYPER.PY_COMPLETE = "complete_powershell"
#     $Env:_TYPER_COMPLETE_ARGS = $commandAst.ToString()
#     $Env:_TYPER_COMPLETE_WORD_TO_COMPLETE = $wordToComplete
#     YABUS_typer.py | ForEach-Object {
#         $commandArray = $_ -Split ":::"
#         $command = $commandArray[0]
#         $helpString = $commandArray[1]
#         [System.Management.Automation.CompletionResult]::new(
#             $command, $command, 'ParameterValue', $helpString)
#     }
#     $Env:_YABUS_TYPER.PY_COMPLETE = ""
#     $Env:_TYPER_COMPLETE_ARGS = ""
#     $Env:_TYPER_COMPLETE_WORD_TO_COMPLETE = ""
# }
# Register-ArgumentCompleter -Native -CommandName YABUS_typer.py -ScriptBlock $scriptblock
