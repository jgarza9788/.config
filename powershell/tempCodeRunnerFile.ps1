$theme_config = Join-Path $env:USERPROFILE ".config\powershell\custom.omp.json"
oh-my-posh --init --shell pwsh --config $theme_config | Invoke-Expression