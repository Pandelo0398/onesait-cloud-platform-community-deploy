# consolidate-stage.ps1 - Snapshot operational DB + package a practice stage (Native Windows or WSL2)
# Usage: .\consolidate-stage.ps1 -StageName "dataflow-etl-base" -Description "Pipeline JDBC source stage"

param(
    [string]$StageName,
    [string]$Description = ''
)

$ErrorActionPreference = "Stop"

. "$PSScriptRoot\wsl-helpers.ps1"
. "$PSScriptRoot\platform-helpers.ps1"

Write-Host "========================================================" -ForegroundColor Cyan
Write-Host "  OnesaitPlatform - Consolidate Practice Stage           " -ForegroundColor Cyan
Write-Host "========================================================" -ForegroundColor Cyan
Write-Host ""

if ([string]::IsNullOrWhiteSpace($StageName)) {
    $StageName = Read-Host "Stage name (e.g. dataflow-etl-base)"
}

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
Write-Host "Stage: $StageName" -ForegroundColor White
if ($Description) { Write-Host "Description: $Description" }
Write-Host ""

$exitCode = 0

try {
    if ($deployMode -eq 'wsl') {
        $wslScriptDir = Get-WslScriptDir -WindowsScriptRoot $PSScriptRoot
        $escapedDir = $wslScriptDir -replace "'", "'\''"
        $escapedName = $StageName -replace "'", "'\''"
        $escapedDesc = $Description -replace "'", "'\''"
        wsl bash -c "cd '$escapedDir' && chmod +x consolidate-stage.sh && ./consolidate-stage.sh '$escapedName' '$escapedDesc'; exit `$?"
        $exitCode = $LASTEXITCODE
    } else {
        if (-not (Test-DockerReady)) {
            throw "Docker is not running."
        }
        Invoke-PlatformConsolidateStage -BaseDir $PSScriptRoot -StageName $StageName -StageDescription $Description
    }
} catch {
    Write-Host ""
    Write-Host "ERROR: $($_.Exception.Message)" -ForegroundColor Red
    $exitCode = 1
}

if ($exitCode -ne 0) {
    Write-Host ""
    Write-Host "Consolidation finished with errors." -ForegroundColor Red
}

Read-Host "Press Enter to close"
