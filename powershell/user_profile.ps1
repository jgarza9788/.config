#https://github.com/craftzdog/dotfiles-public/blob/master/.config/powershell/user_profile.ps1

#mh-my-posh theme

$theme_config = Join-Path $env:USERPROFILE ".config\powershell\custom.omp.json"
echo $theme_config
oh-my-posh --init --shell pwsh --config $theme_config | Invoke-Expression

# icons in terminal
Import-Module -Name Terminal-Icons

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# spotify function
Function spotify-thing
{
    start spotify 
    # Start-Process spotify -WindowStyle Minimized
    # Start-Sleep -Seconds 2.0

    # Add-Type -AssemblyName System.Windows.Forms
    # [System.Windows.Forms.SendKeys]::SendWait("%{TAB}{ENTER}")

    # (Get-Process | Where-Object {$_.name -Match 'Terminal'}) | Set-WindowState -State MINIMIZE
    # Start-Process spotify -WindowStyle Minimized
    C:\Users\JGarza\misc_programs\spt.exe
}

# Alias
Set-Alias run start
Set-Alias open start
Set-Alias ll ls
Set-Alias g git
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
Set-Alias -Name spt -Value spotify-thing -Description "runs spotify"

# hide dot folders in home folder
# ATTRIB +H /d C:\User\JGarza\.*


# conda + powershell
# powershell -ExecutionPolicy ByPass -NoExit -Command "& 'C:\Users\JGarza\miniconda3\shell\condabin\conda-hook.ps1' ; conda activate 'C:\Users\JGarza\miniconda3\'"
# conda init powershell -q

#  cd to folder
cd C:\users\JGarza\github\

# clear before showing
# clear


