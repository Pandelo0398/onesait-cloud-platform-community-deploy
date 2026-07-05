#!/bin/bash
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Iniciando restauración de semillas de base de datos..."

# 1a. Importar Dump del realm Keycloak si existe (crítico en instalaciones nuevas)
# El realm onesaitplatform debe existir antes de que el Control Panel pueda autenticarse.
# IMPORTANTE: restore.sh corre antes de que Keycloak arranque, así que la BD 'keycloak'
# puede no existir todavía — la creamos explícitamente antes de importar.
if [ -f "$BASE_DIR/db_seed/keycloak.sql" ]; then
    echo "Creando base de datos keycloak si no existe..."
    docker exec configdb mysql -u root -pchangeIt! \
        -e "CREATE DATABASE IF NOT EXISTS keycloak CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
    echo "Importando dump de Keycloak (realm onesaitplatform)..."
    docker exec -i configdb mysql -u root -pchangeIt! keycloak < "$BASE_DIR/db_seed/keycloak.sql"
    if [ $? -eq 0 ]; then
        echo "Keycloak DB importada con éxito. Keycloak arrancará con el realm pre-configurado."
    else
        echo "Error al importar Keycloak DB."
    fi
else
    echo "No se encontró db_seed/keycloak.sql. Saltando (realm debe pre-existir)..."
fi

# 1b. Importar Dump de master_config si existe (requerido por Keycloak SPI)
if [ -f "$BASE_DIR/db_seed/master_config.sql" ]; then
    echo "Importando dump de onesaitplatform_master_config..."
    docker exec -i configdb mysql -u root -pchangeIt! onesaitplatform_master_config < "$BASE_DIR/db_seed/master_config.sql"
    [ $? -eq 0 ] && echo "master_config importado con éxito." || echo "Error al importar master_config."
fi

# 1c. Importar Dump de MariaDB (configdb) si existe
if [ -f "$BASE_DIR/db_seed/configdb.sql" ]; then
    echo "Importando dump de MariaDB (configdb)..."
    docker exec -i configdb mysql -u root -pchangeIt! onesaitplatform_config < "$BASE_DIR/db_seed/configdb.sql"
    if [ $? -eq 0 ]; then
        echo "configdb importado con éxito."
    else
        echo "Error al importar configdb."
    fi
else
    echo "No se encontró dump de MariaDB en db_seed/configdb.sql. Saltando..."
fi

# 2. Importar Dump de MongoDB si existe
if [ -d "$BASE_DIR/db_seed/realtimedb" ]; then
    echo "Importando dump de MongoDB (realtimedb)..."
    docker cp "$BASE_DIR/db_seed/realtimedb" realtimedb:/tmp/realtimedb
    docker exec -i realtimedb mongorestore --drop --dir /tmp/realtimedb
    docker exec -i realtimedb rm -rf /tmp/realtimedb
    echo "realtimedb importado con éxito."
else
    echo "No se encontró dump de MongoDB en db_seed/realtimedb. Saltando..."
fi

# 3. Configurar cuentas de los estudiantes y contraseñas compatibles con Keycloak
echo "Configurando usuarios de estudiantes y hashes de contraseña..."

# 3.1. Insertar estudiantes y actualizar contraseñas en onesaitplatform_config
docker exec -i configdb mysql -u root -pchangeIt! onesaitplatform_config << 'EOF'
INSERT INTO user (user_id, active, created_at, email, full_name, password, updated_at, role_id) VALUES
-- ROLE_DATASCIENTIST: can access Dataflow (DataflowController requires ROLE_ADMINISTRATOR or ROLE_DATASCIENTIST)
('anyi', 1, NOW(), 'anyi@onesaitplatform.com', 'Anyi', 'IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=', NOW(), 'ROLE_DATASCIENTIST'),
('fernando', 1, NOW(), 'fernando@onesaitplatform.com', 'Fernando', 'IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=', NOW(), 'ROLE_DATASCIENTIST'),
('jairodavis', 1, NOW(), 'jairodavis@onesaitplatform.com', 'Jairo Davis', 'IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=', NOW(), 'ROLE_DATASCIENTIST'),
-- ROLE_DEVELOPER: standard developer access
('wesfalia', 1, NOW(), 'wesfalia@onesaitplatform.com', 'Wesfalia', 'IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=', NOW(), 'ROLE_DEVELOPER'),
('kevin', 1, NOW(), 'kevin@onesaitplatform.com', 'Kevin', 'IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=', NOW(), 'ROLE_DEVELOPER'),
('pamela', 1, NOW(), 'pamela@onesaitplatform.com', 'Pamela', 'IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=', NOW(), 'ROLE_DEVELOPER'),
('isaias', 1, NOW(), 'isaias@onesaitplatform.com', 'Isaias', 'IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=', NOW(), 'ROLE_DEVELOPER')
ON DUPLICATE KEY UPDATE password='IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=', active=1, role_id=VALUES(role_id);

-- Asegurar que todos los usuarios por defecto tengan la contraseña compatible con Keycloak (onesaitplatform)
UPDATE user SET password='IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=';
EOF

# 3.2. Insertar estudiantes y actualizar contraseñas en onesaitplatform_master_config (Requerido por Keycloak)
docker exec -i configdb mysql -u root -pchangeIt! onesaitplatform_master_config << 'EOF'
INSERT INTO master_user (user_id, active, created_at, email, failed_attemps, full_name, last_login, last_pswd_update, password, updated_at, tenant_id) VALUES
('anyi', 1, NOW(), 'anyi@onesaitplatform.com', 0, 'Anyi', NOW(), NOW(), 'IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=', NOW(), 'MASTER-Tenant-1'),
('fernando', 1, NOW(), 'fernando@onesaitplatform.com', 0, 'Fernando', NOW(), NOW(), 'IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=', NOW(), 'MASTER-Tenant-1'),
('jairodavis', 1, NOW(), 'jairodavis@onesaitplatform.com', 0, 'Jairo Davis', NOW(), NOW(), 'IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=', NOW(), 'MASTER-Tenant-1'),
('wesfalia', 1, NOW(), 'wesfalia@onesaitplatform.com', 0, 'Wesfalia', NOW(), NOW(), 'IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=', NOW(), 'MASTER-Tenant-1'),
('kevin', 1, NOW(), 'kevin@onesaitplatform.com', 0, 'Kevin', NOW(), NOW(), 'IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=', NOW(), 'MASTER-Tenant-1'),
('pamela', 1, NOW(), 'pamela@onesaitplatform.com', 0, 'Pamela', NOW(), NOW(), 'IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=', NOW(), 'MASTER-Tenant-1'),
('isaias', 1, NOW(), 'isaias@onesaitplatform.com', 0, 'Isaias', NOW(), NOW(), 'IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=', NOW(), 'MASTER-Tenant-1')
ON DUPLICATE KEY UPDATE password='IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=', active=1;

-- Asegurar que todos los usuarios maestros tengan la contraseña compatible con Keycloak (onesaitplatform)
UPDATE master_user SET password='IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=';
EOF

if [ $? -eq 0 ]; then
    echo "Usuarios y contraseñas configurados correctamente para Control Panel y Keycloak."
else
    echo "Error al configurar usuarios."
fi

echo "Proceso de restauración completado."
