# "C:\Users\JGarza\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned


# oh-my-posh theme
$theme_config = Join-Path $env:USERPROFILE "\GitHub\.config\powershell\custom.omp.json"
oh-my-posh --init --shell pwsh --config $theme_config | Invoke-Expression


# PSReadLine
Set-PSReadLineOption -PredictionSource History

# # Fzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'

# enables the reverse history lookup
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.SendKeys]::SendWait("^r")


# # clear before showing
Clear-Host

