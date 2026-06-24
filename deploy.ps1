# deploy.ps1 - First-time deployment (Native Windows or WSL2)
# Run from Windows PowerShell or Windows Terminal (right-click > Run with PowerShell)

$ErrorActionPreference = "Stop"

. "$PSScriptRoot\wsl-helpers.ps1"
. "$PSScriptRoot\platform-helpers.ps1"

Write-Host "========================================================" -ForegroundColor Blue
Write-Host "  OnesaitPlatform - First-time Deploy                  " -ForegroundColor Blue
Write-Host "========================================================" -ForegroundColor Blue
Write-Host ""

$deployMode = Resolve-DeployMode -ScriptRoot $PSScriptRoot -AllowPrompt
if (-not $deployMode) {
    Show-DeployModeError -ScriptRoot $PSScriptRoot
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host "Deployment mode: $deployMode" -ForegroundColor Cyan
Save-DeployMode -ScriptRoot $PSScriptRoot -Mode $deployMode

$exitCode = 0
$serverName = 'localhost'

try {
    if ($deployMode -eq 'wsl') {
        $wslScriptDir = Get-WslScriptDir -WindowsScriptRoot $PSScriptRoot
        Write-Host "Project path (WSL): $wslScriptDir" -ForegroundColor Cyan
        Write-Host "Launching deploy.sh in WSL2..." -ForegroundColor Yellow
        Write-Host "(Answer the prompts in the terminal below)" -ForegroundColor Cyan
        Write-Host ""
        $exitCode = Invoke-WslBashScript -WslScriptDir $wslScriptDir -ScriptName "deploy.sh"
    } else {
        Write-Host "Project path: $PSScriptRoot" -ForegroundColor Cyan
        Write-Host "Launching native Windows deployment..." -ForegroundColor Yellow
        Write-Host "(Answer the prompts in the terminal below)" -ForegroundColor Cyan
        Write-Host ""
        $serverName = Invoke-PlatformDeploy -BaseDir $PSScriptRoot
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
    Write-Host "  Deployment complete!                                  " -ForegroundColor Green
    Write-Host "========================================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "Opening browser at: $url" -ForegroundColor Cyan
    Write-Host "(Accept the self-signed certificate warning in your browser)" -ForegroundColor Yellow
    Write-Host ""

    Start-Sleep -Seconds 3
    Start-Process $url
} else {
    Write-Host ""
    Write-Host "ERROR: Deployment finished with errors. Check the output above." -ForegroundColor Red
}

Read-Host "Press Enter to close"
