function Test-DockerReady {
    if (-not (Get-Command docker -ErrorAction SilentlyContinue)) {
        return $false
    }
    docker info 2>$null | Out-Null
    return $LASTEXITCODE -eq 0
}

function Test-WslDeployReady {
    param([string]$ScriptRoot)

    if (-not (Get-Command wsl -ErrorAction SilentlyContinue)) {
        return $false
    }

    $bashCheck = wsl bash -c "echo ok" 2>$null
    if ($LASTEXITCODE -ne 0 -or $bashCheck -ne 'ok') {
        return $false
    }

    $wslPath = (wsl wslpath -a $ScriptRoot 2>$null)
    if ($LASTEXITCODE -ne 0 -or [string]::IsNullOrWhiteSpace($wslPath)) {
        return $false
    }

    $escapedPath = $wslPath.Trim() -replace "'", "'\''"
    $dirCheck = wsl bash -c "test -d '$escapedPath' && echo ok"
    return ($dirCheck -eq 'ok')
}

function Test-NativeDeployReady {
    if (-not (Test-DockerReady)) {
        return $false
    }
    return $null -ne (Find-BashExecutable)
}

function Resolve-DeployMode {
    param(
        [Parameter(Mandatory = $true)]
        [string]$ScriptRoot,
        [switch]$AllowPrompt
    )

    if ($env:ONESAIT_DEPLOY_MODE -in @('wsl', 'native')) {
        return $env:ONESAIT_DEPLOY_MODE
    }

    $modeFile = Join-Path $ScriptRoot '.deploy-mode'
    if (Test-Path $modeFile) {
        $saved = (Get-Content $modeFile -Raw).Trim()
        if ($saved -in @('wsl', 'native')) {
            return $saved
        }
    }

    $wslReady = Test-WslDeployReady -ScriptRoot $ScriptRoot
    $nativeReady = Test-NativeDeployReady

    if ($wslReady -and $nativeReady -and $AllowPrompt) {
        Write-Host ""
        Write-Host "Both deployment modes are available:" -ForegroundColor Cyan
        Write-Host "  1) Native Windows  - Docker Desktop + localhost (Onesait official)"
        Write-Host "  2) WSL2            - bash scripts + WSL IP"
        $choice = Read-Host "Choose mode [1/2, default: 1]"
        if ($choice -eq '2') { return 'wsl' }
        return 'native'
    }

    if ($nativeReady) { return 'native' }
    if ($wslReady) { return 'wsl' }

    return $null
}

function Get-SavedDeployMode {
    param([string]$ScriptRoot)

    if ($env:ONESAIT_DEPLOY_MODE -in @('wsl', 'native')) {
        return $env:ONESAIT_DEPLOY_MODE
    }

    $modeFile = Join-Path $ScriptRoot '.deploy-mode'
    if (Test-Path $modeFile) {
        $saved = (Get-Content $modeFile -Raw).Trim()
        if ($saved -in @('wsl', 'native')) {
            return $saved
        }
    }

    $profileFile = Join-Path $ScriptRoot '.profile'
    if (Test-Path $profileFile) {
        $match = Select-String -Path $profileFile -Pattern '^DEPLOY_MODE=(.+)$'
        if ($match) {
            $mode = $match.Matches[0].Groups[1].Value
            if ($mode -in @('wsl', 'native')) {
                return $mode
            }
        }
        # Deployments created before dual-mode support used WSL/bash scripts.
        return 'wsl'
    }

    return (Resolve-DeployMode -ScriptRoot $ScriptRoot)
}

function Save-DeployMode {
    param(
        [string]$ScriptRoot,
        [string]$Mode
    )
    Set-Content -Path (Join-Path $ScriptRoot '.deploy-mode') -Value $Mode -NoNewline
}

function Get-PlatformProfiles {
    return @{
        '1' = @{
            Name    = 'FULL'
            Modules = @(
                'keycloak', 'mlops-manager', 'control-panel', 'keycloak-manager', 'router',
                'iotbroker', 'api-manager', 'flowengine', 'dataflow', 'dashboard-engine',
                'notebooks', 'nginx-proxy'
            )
        }
        '2' = @{
            Name    = 'INTEGRATION'
            Modules = @(
                'keycloak', 'mlops-manager', 'control-panel', 'keycloak-manager', 'router',
                'iotbroker', 'api-manager', 'flowengine', 'dataflow', 'nginx-proxy'
            )
        }
        '3' = @{
            Name    = 'REPORTING'
            Modules = @(
                'keycloak', 'mlops-manager', 'control-panel', 'keycloak-manager',
                'dashboard-engine', 'nginx-proxy'
            )
        }
        '4' = @{
            Name    = 'ANALYTICS'
            Modules = @(
                'keycloak', 'mlops-manager', 'control-panel', 'keycloak-manager',
                'notebooks', 'nginx-proxy'
            )
        }
    }
}

function Select-PlatformProfile {
    $profiles = Get-PlatformProfiles
    Write-Host ""
    Write-Host "Select your work group profile:" -ForegroundColor White
    Write-Host "1) Full / Teacher       (All modules - requires >12GB RAM)"
    Write-Host "2) Data Integration     (DBs, Control Panel, Keycloak, Dataflow, FlowEngine, IoT/APIs)"
    Write-Host "3) Reporting & Business (DBs, Control Panel, Keycloak, DashboardEngine)"
    Write-Host "4) Predictive Analytics (DBs, Control Panel, Keycloak, Notebooks)"

    $choice = Read-Host "Option [1-4]"
    if (-not $profiles.ContainsKey($choice)) {
        Write-Host "Invalid option." -ForegroundColor Red
        exit 1
    }

    return $profiles[$choice]
}

function Save-PlatformProfile {
    param(
        [string]$BaseDir,
        [string]$ProfileName,
        [string[]]$Modules,
        [string]$DeployMode
    )

    $moduleList = $Modules -join ' '
    @(
        "PROFILE=$ProfileName"
        "MODULES=`"$moduleList`""
        "DEPLOY_MODE=$DeployMode"
    ) | Set-Content (Join-Path $BaseDir '.profile')

    Save-DeployMode -ScriptRoot $BaseDir -Mode $DeployMode
}

function Get-PlatformProfile {
    param([string]$BaseDir)

    $profileFile = Join-Path $BaseDir '.profile'
    if (-not (Test-Path $profileFile)) {
        throw "Profile file not found. Run deploy first."
    }

    $result = @{
        PROFILE     = ''
        MODULES     = @()
        DEPLOY_MODE = ''
    }

    Get-Content $profileFile | ForEach-Object {
        if ($_ -match '^PROFILE=(.+)$') { $result.PROFILE = $Matches[1] }
        if ($_ -match '^MODULES="(.+)"$') { $result.MODULES = $Matches[1] -split '\s+' }
        if ($_ -match '^DEPLOY_MODE=(.+)$') { $result.DEPLOY_MODE = $Matches[1] }
    }

    if ($result.MODULES.Count -eq 0) {
        throw "Invalid profile file."
    }

    return $result
}

function Set-EnvLine {
    param(
        [string]$FilePath,
        [string]$Key,
        [string]$Value
    )

    $escapedKey = [regex]::Escape($Key)
    $pattern = "^$escapedKey="
    $lines = Get-Content $FilePath
    $updated = $false
    $newLines = foreach ($line in $lines) {
        if ($line -match $pattern) {
            $updated = $true
            "$Key=$Value"
        } else {
            $line
        }
    }

    if (-not $updated) {
        $newLines += "$Key=$Value"
    }

    Set-Content -Path $FilePath -Value $newLines
}

function Set-ServerNameInAllEnv {
    param(
        [string]$BaseDir,
        [string]$ServerName
    )

    Get-ChildItem -Path $BaseDir -Recurse -Filter '.env' -File | ForEach-Object {
        Set-EnvLine -FilePath $_.FullName -Key 'SERVER_NAME' -Value $ServerName
    }
}

function Find-BashExecutable {
    $candidates = @(
        (Join-Path ${env:ProgramFiles} 'Git\bin\bash.exe'),
        (Join-Path ${env:ProgramFiles(x86)} 'Git\bin\bash.exe')
    )

    foreach ($candidate in $candidates) {
        if ($candidate -and (Test-Path $candidate)) {
            return $candidate
        }
    }

    if (Get-Command bash -ErrorAction SilentlyContinue) {
        return 'bash'
    }

    return $null
}

function Invoke-GenerateCertificates {
    param(
        [string]$NginxDir,
        [string]$ServerName
    )

    $bash = Find-BashExecutable
    if (-not $bash) {
        throw "bash/OpenSSL not found. Install Git for Windows or use WSL mode."
    }

    $scriptPath = Join-Path $NginxDir 'generate_certificates.sh'
    $content = Get-Content $scriptPath -Raw
    $content = $content -replace 'export COMMONNAME="[^"]*"', "export COMMONNAME=`"$ServerName`""
    Set-Content -Path $scriptPath -Value $content -NoNewline

    Push-Location $NginxDir
    try {
        & $bash ./generate_certificates.sh
        if ($LASTEXITCODE -ne 0) {
            throw "Certificate generation failed."
        }
    } finally {
        Pop-Location
    }
}

function Get-DockerBridgeIp {
    $bridgeIp = docker network inspect op_data_datanetwork --format '{{(index .IPAM.Config 0).Gateway}}' 2>$null
    if ($LASTEXITCODE -ne 0 -or [string]::IsNullOrWhiteSpace($bridgeIp)) {
        return '172.28.0.1'
    }
    return $bridgeIp.Trim()
}

function Wait-DatabaseReady {
    Write-Host ""
    Write-Host "Waiting for databases..." -ForegroundColor Yellow

    while ($true) {
        docker exec configdb mysqladmin ping -h localhost --silent 2>$null | Out-Null
        if ($LASTEXITCODE -eq 0) { break }
        Write-Host "Waiting for configdb (MariaDB)..."
        Start-Sleep -Seconds 2
    }
    Write-Host "configdb is ready." -ForegroundColor Green

    while ($true) {
        docker exec realtimedb mongosh --eval 'db.adminCommand({ping: 1})' --quiet 2>$null | Out-Null
        if ($LASTEXITCODE -eq 0) { break }
        Write-Host "Waiting for realtimedb (MongoDB)..."
        Start-Sleep -Seconds 2
    }
    Write-Host "realtimedb is ready." -ForegroundColor Green
}

function Initialize-PlatformDatabase {
    param([string]$BaseDir)

    $opDataDir = Join-Path $BaseDir 'op_data'
    $initFlag = Join-Path $opDataDir 'data\.initialized'

    if (Test-Path $initFlag) {
        return
    }

    Write-Host ""
    Write-Host "First run detected. Initializing OnesaitPlatform database..." -ForegroundColor Yellow

    docker rm -f configinitservice 2>$null | Out-Null

    Push-Location $opDataDir
    try {
        docker compose -f docker-compose.initdb.yml down 2>$null | Out-Null

        Write-Host "Step 1/2: Initializing MariaDB (configdb)..." -ForegroundColor Yellow
        docker compose -f docker-compose.initdb.yml up --abort-on-container-exit
        if ($LASTEXITCODE -ne 0) {
            throw "MariaDB initialization failed."
        }

        Write-Host "Step 2/2: Initializing MongoDB (realtimedb)..." -ForegroundColor Yellow
        docker rm -f configinitservice 2>$null | Out-Null
        $env:LOADMONGODB = 'true'
        try {
            docker compose -f docker-compose.initdb.yml up --abort-on-container-exit
            if ($LASTEXITCODE -ne 0) {
                throw "MongoDB initialization failed."
            }
        } finally {
            Remove-Item Env:LOADMONGODB -ErrorAction SilentlyContinue
        }
    } finally {
        Pop-Location
    }

    New-Item -Path $initFlag -ItemType File -Force | Out-Null
    Write-Host "Database initialized successfully." -ForegroundColor Green
}

function Invoke-PlatformRestore {
    param([string]$BaseDir)

    Write-Host ""
    Write-Host "Running restore/seed script..." -ForegroundColor Yellow

    $configDump = Join-Path $BaseDir 'db_seed\configdb.sql'
    if (Test-Path $configDump) {
        Write-Host "Importing MariaDB dump (configdb)..."
        Get-Content $configDump -Raw | docker exec -i configdb mysql -u root -pchangeIt!
        if ($LASTEXITCODE -eq 0) {
            Write-Host "configdb imported successfully." -ForegroundColor Green
        } else {
            Write-Host "Error importing configdb." -ForegroundColor Red
        }
    }

    $mongoDump = Join-Path $BaseDir 'db_seed\realtimedb'
    if (Test-Path $mongoDump) {
        Write-Host "Importing MongoDB dump (realtimedb)..."
        docker cp $mongoDump realtimedb:/tmp/realtimedb
        docker exec -i realtimedb mongorestore --drop --dir /tmp/realtimedb
        docker exec -i realtimedb rm -rf /tmp/realtimedb
        Write-Host "realtimedb imported successfully." -ForegroundColor Green
    }

    $configSql = @'
INSERT INTO user (user_id, active, created_at, email, full_name, password, updated_at, role_id) VALUES
('anyi', 1, NOW(), 'anyi@onesaitplatform.com', 'Anyi', 'IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=', NOW(), 'ROLE_DATASCIENTIST'),
('fernando', 1, NOW(), 'fernando@onesaitplatform.com', 'Fernando', 'IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=', NOW(), 'ROLE_DATASCIENTIST'),
('wesfalia', 1, NOW(), 'wesfalia@onesaitplatform.com', 'Wesfalia', 'IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=', NOW(), 'ROLE_DEVELOPER'),
('kevin', 1, NOW(), 'kevin@onesaitplatform.com', 'Kevin', 'IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=', NOW(), 'ROLE_DEVELOPER'),
('pamela', 1, NOW(), 'pamela@onesaitplatform.com', 'Pamela', 'IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=', NOW(), 'ROLE_DEVELOPER'),
('isaias', 1, NOW(), 'isaias@onesaitplatform.com', 'Isaias', 'IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=', NOW(), 'ROLE_DEVELOPER')
ON DUPLICATE KEY UPDATE password='IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=', active=1, role_id=VALUES(role_id);
UPDATE user SET password='IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=';
'@

    $masterSql = @'
INSERT INTO master_user (user_id, active, created_at, email, failed_attemps, full_name, last_login, last_pswd_update, password, updated_at, tenant_id) VALUES
('anyi', 1, NOW(), 'anyi@onesaitplatform.com', 0, 'Anyi', NOW(), NOW(), 'IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=', NOW(), 'MASTER-Tenant-1'),
('fernando', 1, NOW(), 'fernando@onesaitplatform.com', 0, 'Fernando', NOW(), NOW(), 'IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=', NOW(), 'MASTER-Tenant-1'),
('wesfalia', 1, NOW(), 'wesfalia@onesaitplatform.com', 0, 'Wesfalia', NOW(), NOW(), 'IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=', NOW(), 'MASTER-Tenant-1'),
('kevin', 1, NOW(), 'kevin@onesaitplatform.com', 0, 'Kevin', NOW(), NOW(), 'IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=', NOW(), 'MASTER-Tenant-1'),
('pamela', 1, NOW(), 'pamela@onesaitplatform.com', 0, 'Pamela', NOW(), NOW(), 'IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=', NOW(), 'MASTER-Tenant-1'),
('isaias', 1, NOW(), 'isaias@onesaitplatform.com', 0, 'Isaias', NOW(), NOW(), 'IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=', NOW(), 'MASTER-Tenant-1')
ON DUPLICATE KEY UPDATE password='IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=', active=1;
UPDATE master_user SET password='IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=';
'@

    Write-Host "Configuring student accounts..."
    $configSql | docker exec -i configdb mysql -u root -pchangeIt! onesaitplatform_config
    $masterSql | docker exec -i configdb mysql -u root -pchangeIt! onesaitplatform_master_config

    if ($LASTEXITCODE -eq 0) {
        Write-Host "Student users configured successfully." -ForegroundColor Green
    }
}

function Sync-PlatformAdminApiKeys {
    param([string]$BaseDir)

    Write-Host ""
    Write-Host "Syncing admin API keys from database..." -ForegroundColor Yellow

    $token = ''
    for ($i = 1; $i -le 10; $i++) {
        $token = (docker exec -i configdb mysql -u root -pchangeIt! onesaitplatform_config -N -B -e "SELECT token FROM user_token WHERE user_id='platform_admin';" 2>$null).Trim()
        if ($token) { break }
        Write-Host "Waiting for platform_admin token... ($i/10)"
        Start-Sleep -Seconds 2
    }

    if (-not $token) {
        Write-Host "Warning: could not obtain platform_admin token." -ForegroundColor Yellow
        return
    }

    Set-EnvLine -FilePath (Join-Path $BaseDir 'op_modules\keycloak-manager\.env') -Key 'PLATFORM_ADMIN_APIKEY' -Value $token
    Set-EnvLine -FilePath (Join-Path $BaseDir 'op_modules\control-panel\.env') -Key 'ADMIN_API_KEY' -Value $token
    Write-Host "API keys synchronized." -ForegroundColor Green
}

function Update-NginxConfig {
    param(
        [string]$NginxDir,
        [string[]]$Modules,
        [string]$ServerName,
        [switch]$IncludeMlflow
    )

    $template = Join-Path $NginxDir 'conf.d\nginx.conf.template'
    $target = Join-Path $NginxDir 'conf.d\nginx.conf'
    Copy-Item -Path $template -Destination $target -Force

    $content = Get-Content $target -Raw

    function Enable-Include([string]$text, [string]$confName) {
        return $text -replace "#include /usr/local/conf.d/$confName;", "include /usr/local/conf.d/$confName;"
    }

    $content = Enable-Include $content 'keycloak.conf'
    if ($Modules -contains 'dashboard-engine') { $content = Enable-Include $content 'dashboardengine.conf' }
    if ($Modules -contains 'notebooks') { $content = Enable-Include $content 'notebook.conf' }
    if ($Modules -contains 'flowengine') { $content = Enable-Include $content 'flowengine.conf' }
    if ($IncludeMlflow) { $content = Enable-Include $content 'mlflow.conf' }
    if ($Modules -contains 'api-manager') {
        $content = Enable-Include $content 'apimanager.conf'
        $content = Enable-Include $content 'digitalbroker.conf'
        $content = Enable-Include $content 'router.conf'
    }

    $content = $content -replace 'server_name \$\{SERVER_NAME\};', "server_name $ServerName;"
    Set-Content -Path $target -Value $content -NoNewline
}

function Initialize-MlflowDatabase {
    docker exec configdb mysql -u root -pchangeIt! -e "CREATE DATABASE IF NOT EXISTS mlflow CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci; CREATE USER IF NOT EXISTS 'mlflow'@'%' IDENTIFIED BY 'mlflowpass'; GRANT ALL PRIVILEGES ON mlflow.* TO 'mlflow'@'%'; FLUSH PRIVILEGES;" 2>$null | Out-Null
}

function Start-PlatformModules {
    param(
        [string]$BaseDir,
        [string[]]$Modules,
        [string]$ProfileName
    )

    if ($Modules -contains 'mlops-manager') {
        Write-Host ""
        Write-Host "Initializing MLflow database..." -ForegroundColor Yellow
        Initialize-MlflowDatabase
    }

    Write-Host ""
    Write-Host "Starting modules for profile $ProfileName..." -ForegroundColor Green
    foreach ($module in $Modules) {
        Write-Host "Starting module: $module..." -ForegroundColor Yellow
        Push-Location (Join-Path $BaseDir "op_modules\$module")
        try {
            docker compose up -d
            if ($LASTEXITCODE -ne 0) {
                throw "Failed to start module: $module"
            }
        } finally {
            Pop-Location
        }
    }
}

function Get-PlatformUrl {
    param(
        [string]$DeployMode,
        [string]$ServerName = 'localhost'
    )

    if ($DeployMode -eq 'wsl') {
        $wslIp = Get-WslIp
        return "https://$wslIp/controlpanel/"
    }

    return "https://$ServerName/controlpanel/"
}

function Invoke-PlatformDeploy {
    param([string]$BaseDir)

    $opDataDir = Join-Path $BaseDir 'op_data'
    $nginxDir = Join-Path $BaseDir 'op_modules\nginx-proxy'

    $serverInput = Read-Host "SERVER_NAME [default: localhost]"
    $serverName = if ([string]::IsNullOrWhiteSpace($serverInput)) { 'localhost' } else { $serverInput }

    Write-Host "Configuring SERVER_NAME=$serverName..." -ForegroundColor Green
    Set-ServerNameInAllEnv -BaseDir $BaseDir -ServerName $serverName

    $selected = Select-PlatformProfile
    Save-PlatformProfile -BaseDir $BaseDir -ProfileName $selected.Name -Modules $selected.Modules -DeployMode 'native'

    Write-Host ""
    Write-Host "Profile selected: $($selected.Name)" -ForegroundColor Green
    Write-Host ""
    Write-Host "Generating self-signed SSL certificates for $serverName..." -ForegroundColor Yellow
    Invoke-GenerateCertificates -NginxDir $nginxDir -ServerName $serverName

    Write-Host ""
    Write-Host "Creating persistence directories..." -ForegroundColor Green
    New-Item -ItemType Directory -Force -Path (Join-Path $opDataDir 'data\mongodb') | Out-Null
    New-Item -ItemType Directory -Force -Path (Join-Path $opDataDir 'data\mariadb') | Out-Null

    Write-Host ""
    Write-Host "Starting databases (MariaDB and MongoDB)..." -ForegroundColor Green
    Push-Location $opDataDir
    try {
        docker compose -f docker-compose.persistent.yml up -d
        if ($LASTEXITCODE -ne 0) { throw "Failed to start databases." }
    } finally {
        Pop-Location
    }

    $bridgeIp = Get-DockerBridgeIp
    Write-Host "Docker bridge IP: $bridgeIp" -ForegroundColor Green
    Set-EnvLine -FilePath (Join-Path $BaseDir 'op_modules\control-panel\.env') -Key 'IP' -Value $bridgeIp

    Wait-DatabaseReady
    Initialize-PlatformDatabase -BaseDir $BaseDir
    Invoke-PlatformRestore -BaseDir $BaseDir
    Sync-PlatformAdminApiKeys -BaseDir $BaseDir

    Write-Host ""
    Write-Host "Configuring Nginx proxy for profile $($selected.Name)..." -ForegroundColor Green
    Update-NginxConfig -NginxDir $nginxDir -Modules $selected.Modules -ServerName $serverName

    Start-PlatformModules -BaseDir $BaseDir -Modules $selected.Modules -ProfileName $selected.Name

    return $serverName
}

function Invoke-PlatformStart {
    param([string]$BaseDir)

    $profile = Get-PlatformProfile -BaseDir $BaseDir
    $opDataDir = Join-Path $BaseDir 'op_data'
    $nginxDir = Join-Path $BaseDir 'op_modules\nginx-proxy'
    $serverName = 'localhost'

    Write-Host "Profile: $($profile.PROFILE) | Modules: $($profile.MODULES -join ' ')" -ForegroundColor Green

    $controlPanelEnv = Join-Path $BaseDir 'op_modules\control-panel\.env'
    $oldServerName = ''
    if (Test-Path $controlPanelEnv) {
        $match = Select-String -Path $controlPanelEnv -Pattern '^SERVER_NAME=(.+)$'
        if ($match) { $oldServerName = $match.Matches[0].Groups[1].Value }
    }

    Write-Host ""
    Write-Host "Using SERVER_NAME=$serverName" -ForegroundColor Yellow
    Set-ServerNameInAllEnv -BaseDir $BaseDir -ServerName $serverName

    Write-Host ""
    Write-Host "Starting databases (MariaDB and MongoDB)..." -ForegroundColor Green
    Push-Location $opDataDir
    try {
        docker compose -f docker-compose.persistent.yml up -d
        if ($LASTEXITCODE -ne 0) { throw "Failed to start databases." }
    } finally {
        Pop-Location
    }

    $bridgeIp = Get-DockerBridgeIp
    Set-EnvLine -FilePath $controlPanelEnv -Key 'IP' -Value $bridgeIp

    if ($serverName -ne $oldServerName) {
        Write-Host ""
        Write-Host "SERVER_NAME changed ($oldServerName -> $serverName). Regenerating SSL certificates..." -ForegroundColor Yellow
        Invoke-GenerateCertificates -NginxDir $nginxDir -ServerName $serverName
    }

    Wait-DatabaseReady
    Sync-PlatformAdminApiKeys -BaseDir $BaseDir

    Write-Host ""
    Write-Host "Reconfiguring Nginx for profile $($profile.PROFILE)..." -ForegroundColor Green
    Update-NginxConfig -NginxDir $nginxDir -Modules $profile.MODULES -ServerName $serverName -IncludeMlflow

    Start-PlatformModules -BaseDir $BaseDir -Modules $profile.MODULES -ProfileName $profile.PROFILE

    return $serverName
}

function Invoke-PlatformStop {
    param([string]$BaseDir)

    Write-Host "Stopping all OnesaitPlatform modules..." -ForegroundColor Red
    foreach ($dir in Get-ChildItem (Join-Path $BaseDir 'op_modules') -Directory) {
        $composeFile = Join-Path $dir.FullName 'docker-compose.yml'
        if (Test-Path $composeFile) {
            Write-Host "Stopping module: $($dir.Name)..."
            Push-Location $dir.FullName
            try {
                docker compose down
            } finally {
                Pop-Location
            }
        }
    }

    Write-Host ""
    Write-Host "Stopping databases (op_data)..." -ForegroundColor Red
    Push-Location (Join-Path $BaseDir 'op_data')
    try {
        docker compose -f docker-compose.persistent.yml down
    } finally {
        Pop-Location
    }
}

function Invoke-PlatformBackup {
    param([string]$BaseDir)

    $seedDir = Join-Path $BaseDir 'db_seed'
    New-Item -ItemType Directory -Force -Path $seedDir | Out-Null

    Write-Host "Creating database backups (dumps)..." -ForegroundColor Yellow

    Write-Host "Exporting configdb (MariaDB)..."
    docker exec -i configdb mysqldump -u root -pchangeIt! --all-databases | Set-Content -Path (Join-Path $seedDir 'configdb.sql') -Encoding utf8

    Write-Host "Exporting realtimedb (MongoDB)..."
    docker exec -i realtimedb mongodump --out /tmp/realtimedb
    if (Test-Path (Join-Path $seedDir 'realtimedb')) {
        Remove-Item -Recurse -Force (Join-Path $seedDir 'realtimedb')
    }
    docker cp realtimedb:/tmp/realtimedb (Join-Path $seedDir 'realtimedb')
    docker exec -i realtimedb rm -rf /tmp/realtimedb

    Write-Host ""
    Write-Host "Dumps saved in $seedDir" -ForegroundColor Green
}

function Get-DataflowInventory {
    $query = "SELECT table_name FROM information_schema.tables WHERE table_schema='onesaitplatform_config' AND (table_name LIKE '%stream%' OR table_name LIKE '%pipeline%' OR table_name LIKE '%dataflow%' OR table_name LIKE '%ss_%');"

    $tables = docker exec configdb mysql -u root -pchangeIt! onesaitplatform_config -N -B -e $query 2>$null
    $inventory = @()

    foreach ($table in ($tables -split "`n")) {
        $table = $table.Trim()
        if (-not $table) { continue }
        $count = (docker exec configdb mysql -u root -pchangeIt! onesaitplatform_config -N -B -e "SELECT COUNT(*) FROM ``$table``;" 2>$null).Trim()
        $inventory += [PSCustomObject]@{ Table = $table; Rows = $count }
    }

    return $inventory
}

function Invoke-PlatformConsolidateStage {
    param(
        [string]$BaseDir,
        [string]$StageName,
        [string]$StageDescription = ''
    )

    if ([string]::IsNullOrWhiteSpace($StageName)) {
        throw "Stage name is required."
    }

    foreach ($container in @('configdb', 'realtimedb')) {
        $running = docker ps --format '{{.Names}}' | Select-String -Pattern "^$container$"
        if (-not $running) {
            throw "Container '$container' is not running. Start the platform first."
        }
    }

    $dataflowStatus = if (docker ps --format '{{.Names}}' | Select-String -Pattern '^streamsets$') { 'running' } else { 'stopped' }
    if ($dataflowStatus -eq 'stopped') {
        Write-Host "Warning: Dataflow (streamsets) is not running. Pipeline state may be incomplete." -ForegroundColor Yellow
    } else {
        Write-Host "Dataflow (streamsets) is running." -ForegroundColor Green
    }

    $profile = 'unknown'
    $modules = ''
    try {
        $saved = Get-PlatformProfile -BaseDir $BaseDir
        $profile = $saved.PROFILE
        $modules = $saved.MODULES -join ' '
    } catch {
        # Profile optional for consolidate
    }

    $seedDir = Join-Path $BaseDir 'db_seed'
    $archiveDir = Join-Path $seedDir "stages\$StageName"
    $timestamp = (Get-Date).ToUniversalTime().ToString('yyyy-MM-ddTHH:mm:ssZ')

    Write-Host ""
    Write-Host "Creating operational database copy in db_seed/..." -ForegroundColor Yellow
    Invoke-PlatformBackup -BaseDir $BaseDir

    Write-Host ""
    Write-Host "Collecting Dataflow inventory from configdb..." -ForegroundColor Yellow
    $inventory = Get-DataflowInventory

    New-Item -ItemType Directory -Force -Path $archiveDir | Out-Null
    Copy-Item (Join-Path $seedDir 'configdb.sql') (Join-Path $archiveDir 'configdb.sql') -Force
    if (Test-Path (Join-Path $archiveDir 'realtimedb')) {
        Remove-Item -Recurse -Force (Join-Path $archiveDir 'realtimedb')
    }
    Copy-Item (Join-Path $seedDir 'realtimedb') (Join-Path $archiveDir 'realtimedb') -Recurse -Force

    $manifest = [ordered]@{
        stage           = $StageName
        description     = $StageDescription
        created_at      = $timestamp
        profile         = $profile
        modules         = $modules
        dataflow_status = $dataflowStatus
        archive_path    = "db_seed/stages/$StageName"
        files           = [ordered]@{
            mariadb = 'db_seed/configdb.sql'
            mongodb = 'db_seed/realtimedb/'
        }
        dataflow_tables = $inventory
        notes           = 'Imported automatically on deploy via restore.sh. Includes ontologies, Dataflow/StreamSets pipelines, APIs and Control Panel configuration.'
    }

    $manifestPath = Join-Path $seedDir 'manifest.json'
    $manifest | ConvertTo-Json -Depth 5 | Set-Content -Path $manifestPath -Encoding utf8
    Copy-Item $manifestPath (Join-Path $archiveDir 'manifest.json') -Force

    Write-Host ""
    Write-Host "Stage consolidated successfully." -ForegroundColor Green
    Write-Host "Active seed:  $seedDir"
    Write-Host "Archive copy: $archiveDir"
    Write-Host "Manifest:     $manifestPath"

    if ($inventory.Count -gt 0) {
        Write-Host ""
        Write-Host "Dataflow-related tables:" -ForegroundColor Cyan
        $inventory | ForEach-Object { Write-Host "  $($_.Table): $($_.Rows)" }
    }

    Write-Host ""
    Write-Host "Next steps:" -ForegroundColor Yellow
    Write-Host "  1. Review db_seed/ contents"
    Write-Host "  2. git add db_seed/ && git commit -m `"consolidate stage: $StageName`""
    Write-Host "  3. Students run deploy.ps1 / deploy.sh — restore will load this snapshot"
}

function Show-DeployModeError {
    param([string]$ScriptRoot)

    Write-Host "ERROR: No deployment mode available." -ForegroundColor Red
    Write-Host ""
    Write-Host "Native Windows requires:" -ForegroundColor Yellow
    Write-Host "  - Docker Desktop running"
    Write-Host "  - Git for Windows (bash + OpenSSL for certificates)"
    Write-Host ""
    Write-Host "WSL mode requires:" -ForegroundColor Yellow
    Write-Host "  - WSL2 with a Linux distribution (e.g. Ubuntu)"
    Write-Host "  - Project accessible from WSL"
    Write-Host ""
    Write-Host "Set ONESAIT_DEPLOY_MODE=native or ONESAIT_DEPLOY_MODE=wsl to force a mode."
}
