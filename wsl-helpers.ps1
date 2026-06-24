function Test-WslAvailable {
    return (Get-Command wsl -ErrorAction SilentlyContinue) -ne $null
}

function Get-WslScriptDir {
    param(
        [Parameter(Mandatory = $true)]
        [string]$WindowsScriptRoot
    )

    $wslPath = (wsl wslpath -a $WindowsScriptRoot 2>$null)
    if ($LASTEXITCODE -ne 0 -or [string]::IsNullOrWhiteSpace($wslPath)) {
        Write-Host "ERROR: Could not convert path to WSL: $WindowsScriptRoot" -ForegroundColor Red
        exit 1
    }

    $wslPath = $wslPath.Trim()
    $escapedPath = $wslPath -replace "'", "'\''"
    $dirCheck = wsl bash -c "test -d '$escapedPath' && echo ok"
    if ($dirCheck -ne 'ok') {
        Write-Host "ERROR: Project directory not found in WSL: $wslPath" -ForegroundColor Red
        exit 1
    }

    return $wslPath
}

function Invoke-WslBashScript {
    param(
        [Parameter(Mandatory = $true)]
        [string]$WslScriptDir,
        [Parameter(Mandatory = $true)]
        [string]$ScriptName
    )

    $escapedDir = $WslScriptDir -replace "'", "'\''"
    wsl bash -c "cd '$escapedDir' && chmod +x $ScriptName && ./$ScriptName; exit `$?"
    return $LASTEXITCODE
}

function Get-WslIp {
    $wslIp = (wsl bash -c "hostname -I") -split '\s+' | Where-Object { $_ -ne '' } | Select-Object -First 1
    return $wslIp
}
