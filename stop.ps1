# stop.ps1 - Stop all OnesaitPlatform containers (Native Windows or WSL2)

$ErrorActionPreference = "Stop"

. "$PSScriptRoot\wsl-helpers.ps1"
. "$PSScriptRoot\platform-helpers.ps1"

Write-Host "========================================================" -ForegroundColor Red
Write-Host "  OnesaitPlatform - Stop                               " -ForegroundColor Red
Write-Host "========================================================" -ForegroundColor Red
Write-Host ""

$deployMode = Get-SavedDeployMode -ScriptRoot $PSScriptRoot
if (-not $deployMode) {
    $deployMode = Resolve-DeployMode -ScriptRoot $PSScriptRoot
}
if (-not $deployMode) {
    Show-DeployModeError -ScriptRoot $PSScriptRoot
    Read-Host "Press Enter to exit"
    exit 1
}

$confirm = Read-Host "Stop all OnesaitPlatform containers? [Y/n]"
if ($confirm -eq 'n' -or $confirm -eq 'N') {
    Write-Host "Cancelled." -ForegroundColor Yellow
    exit 0
}

Write-Host ""
Write-Host "Deployment mode: $deployMode" -ForegroundColor Cyan
Write-Host "Stopping all containers..." -ForegroundColor Yellow

$exitCode = 0

try {
    if ($deployMode -eq 'wsl') {
        $wslScriptDir = Get-WslScriptDir -WindowsScriptRoot $PSScriptRoot
        Write-Host "Project path (WSL): $wslScriptDir" -ForegroundColor Cyan
        $exitCode = Invoke-WslBashScript -WslScriptDir $wslScriptDir -ScriptName "stop.sh"
    } else {
        Write-Host "Project path: $PSScriptRoot" -ForegroundColor Cyan
        Invoke-PlatformStop -BaseDir $PSScriptRoot
    }
} catch {
    Write-Host ""
    Write-Host "ERROR: $($_.Exception.Message)" -ForegroundColor Red
    $exitCode = 1
}

Write-Host ""
if ($exitCode -eq 0) {
    Write-Host "All containers stopped." -ForegroundColor Green
} else {
    Write-Host "Stop finished with warnings. Check the output above." -ForegroundColor Yellow
}

Read-Host "Press Enter to close"
