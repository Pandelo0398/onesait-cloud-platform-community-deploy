# start.ps1 - Start OnesaitPlatform (Native Windows or WSL2)

$ErrorActionPreference = "Stop"

. "$PSScriptRoot\wsl-helpers.ps1"
. "$PSScriptRoot\platform-helpers.ps1"

Write-Host "========================================================" -ForegroundColor Blue
Write-Host "  OnesaitPlatform - Start                              " -ForegroundColor Blue
Write-Host "========================================================" -ForegroundColor Blue
Write-Host ""

$deployMode = Get-SavedDeployMode -ScriptRoot $PSScriptRoot
if (-not $deployMode) {
    Show-DeployModeError -ScriptRoot $PSScriptRoot
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host "Deployment mode: $deployMode" -ForegroundColor Cyan

$exitCode = 0
$serverName = 'localhost'

try {
    if ($deployMode -eq 'wsl') {
        $wslScriptDir = Get-WslScriptDir -WindowsScriptRoot $PSScriptRoot
        Write-Host "Project path (WSL): $wslScriptDir" -ForegroundColor Cyan
        Write-Host "Starting OnesaitPlatform in WSL2..." -ForegroundColor Yellow
        Write-Host ""
        $exitCode = Invoke-WslBashScript -WslScriptDir $wslScriptDir -ScriptName "start.sh"
    } else {
        Write-Host "Project path: $PSScriptRoot" -ForegroundColor Cyan
        Write-Host "Starting OnesaitPlatform (native Windows)..." -ForegroundColor Yellow
        Write-Host ""
        $serverName = Invoke-PlatformStart -BaseDir $PSScriptRoot
    }
} catch {
    Write-Host ""
    Write-Host "ERROR: $($_.Exception.Message)" -ForegroundColor Red
    $exitCode = 1
}

if ($exitCode -eq 0) {
    $url = Get-PlatformUrl -DeployMode $deployMode -ServerName $serverName

    Write-Host ""
    Write-Host "========================================================" -ForegroundColor Green
    Write-Host "  OnesaitPlatform is up!                               " -ForegroundColor Green
    Write-Host "========================================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "URL: $url" -ForegroundColor Cyan
    Write-Host "(Use InPrivate/Incognito window if you see redirect errors)" -ForegroundColor Yellow
    Write-Host ""

    $openBrowser = Read-Host "Open browser now? [Y/n]"
    if ($openBrowser -ne 'n' -and $openBrowser -ne 'N') {
        Start-Process $url
    }
} else {
    Write-Host ""
    Write-Host "ERROR: Start finished with errors. Check the output above." -ForegroundColor Red
    Read-Host "Press Enter to close"
}
