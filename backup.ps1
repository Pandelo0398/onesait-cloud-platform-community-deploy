# backup.ps1 - Export database dumps to db_seed/ (Native Windows or WSL2)

$ErrorActionPreference = "Stop"

. "$PSScriptRoot\wsl-helpers.ps1"
. "$PSScriptRoot\platform-helpers.ps1"

Write-Host "========================================================" -ForegroundColor Blue
Write-Host "  OnesaitPlatform - Database Backup                    " -ForegroundColor Blue
Write-Host "========================================================" -ForegroundColor Blue
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

Write-Host "Deployment mode: $deployMode" -ForegroundColor Cyan
Write-Host ""

$exitCode = 0

try {
    if ($deployMode -eq 'wsl') {
        $wslScriptDir = Get-WslScriptDir -WindowsScriptRoot $PSScriptRoot
        Write-Host "Project path (WSL): $wslScriptDir" -ForegroundColor Cyan
        $exitCode = Invoke-WslBashScript -WslScriptDir $wslScriptDir -ScriptName "backup.sh"
    } else {
        if (-not (Test-DockerReady)) {
            throw "Docker is not running."
        }
        Write-Host "Project path: $PSScriptRoot" -ForegroundColor Cyan
        Invoke-PlatformBackup -BaseDir $PSScriptRoot
    }
} catch {
    Write-Host ""
    Write-Host "ERROR: $($_.Exception.Message)" -ForegroundColor Red
    $exitCode = 1
}

if ($exitCode -ne 0) {
    Write-Host ""
    Write-Host "Backup finished with errors." -ForegroundColor Red
}

Read-Host "Press Enter to close"
