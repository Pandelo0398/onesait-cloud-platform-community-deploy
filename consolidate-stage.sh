#!/bin/bash
# Consolidate an operational DB snapshot into db_seed/ for student distribution.
# Usage: ./consolidate-stage.sh <stage-name> [description]
# Example: ./consolidate-stage.sh dataflow-etl-base "Pipeline JDBC + transform stage"

set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SEED_DIR="$BASE_DIR/db_seed"
STAGES_DIR="$SEED_DIR/stages"

STAGE_NAME="${1:-}"
STAGE_DESC="${2:-}"

if [ -z "$STAGE_NAME" ]; then
    read -p "Stage name (e.g. dataflow-etl-base): " STAGE_NAME
fi

if [ -z "$STAGE_NAME" ]; then
    echo -e "${RED}Stage name is required.${NC}"
    exit 1
fi

if [ -z "$STAGE_DESC" ]; then
    read -p "Description [optional]: " STAGE_DESC
fi

echo -e "${CYAN}${BOLD}========================================================"
echo -e "  OnesaitPlatform - Consolidate Practice Stage"
echo -e "========================================================${NC}"
echo -e "Stage: ${BOLD}$STAGE_NAME${NC}"
[ -n "$STAGE_DESC" ] && echo -e "Description: $STAGE_DESC"
echo ""

for container in configdb realtimedb; do
    if ! docker ps --format '{{.Names}}' | grep -qx "$container"; then
        echo -e "${RED}Container '$container' is not running. Start the platform first.${NC}"
        exit 1
    fi
done

if docker ps --format '{{.Names}}' | grep -qx streamsets; then
    echo -e "${GREEN}Dataflow (streamsets) is running.${NC}"
    DATAFLOW_STATUS="running"
else
    echo -e "${YELLOW}Warning: Dataflow (streamsets) is not running. Pipeline state may be incomplete.${NC}"
    DATAFLOW_STATUS="stopped"
fi

PROFILE="unknown"
MODULES=""
if [ -f "$BASE_DIR/.profile" ]; then
  # shellcheck disable=SC1090
    source "$BASE_DIR/.profile"
fi

TIMESTAMP="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
ARCHIVE_DIR="$STAGES_DIR/$STAGE_NAME"

echo ""
echo -e "${YELLOW}Creating operational database copy in db_seed/...${NC}"
chmod +x "$BASE_DIR/backup.sh"
"$BASE_DIR/backup.sh"

echo ""
echo -e "${YELLOW}Collecting Dataflow inventory from configdb...${NC}"
DATAFLOW_TABLES="$(docker exec configdb mysql -u root -pchangeIt! onesaitplatform_config -N -B -e \
    "SELECT table_name FROM information_schema.tables
     WHERE table_schema='onesaitplatform_config'
       AND (table_name LIKE '%stream%' OR table_name LIKE '%pipeline%'
            OR table_name LIKE '%dataflow%' OR table_name LIKE '%ss_%');" 2>/dev/null || true)"

DATAFLOW_COUNTS=""
if [ -n "$DATAFLOW_TABLES" ]; then
    while IFS= read -r table; do
        [ -z "$table" ] && continue
        count="$(docker exec configdb mysql -u root -pchangeIt! onesaitplatform_config -N -B -e "SELECT COUNT(*) FROM \`$table\`;" 2>/dev/null || echo "?")"
        DATAFLOW_COUNTS="${DATAFLOW_COUNTS}    $table: $count\n"
    done <<< "$DATAFLOW_TABLES"
fi

mkdir -p "$ARCHIVE_DIR"
cp "$SEED_DIR/configdb.sql" "$ARCHIVE_DIR/configdb.sql"
rm -rf "$ARCHIVE_DIR/realtimedb"
cp -r "$SEED_DIR/realtimedb" "$ARCHIVE_DIR/realtimedb"

MANIFEST="$SEED_DIR/manifest.json"
ARCHIVE_MANIFEST="$ARCHIVE_DIR/manifest.json"

cat > "$MANIFEST" <<EOF
{
  "stage": "$STAGE_NAME",
  "description": "$STAGE_DESC",
  "created_at": "$TIMESTAMP",
  "profile": "$PROFILE",
  "modules": "$MODULES",
  "dataflow_status": "$DATAFLOW_STATUS",
  "archive_path": "db_seed/stages/$STAGE_NAME",
  "files": {
    "mariadb": "db_seed/configdb.sql",
    "mongodb": "db_seed/realtimedb/"
  },
  "notes": "Importado automaticamente en deploy via restore.sh. Incluye ontologias, pipelines Dataflow/StreamSets, APIs y configuracion del Control Panel."
}
EOF

cp "$MANIFEST" "$ARCHIVE_MANIFEST"

echo ""
echo -e "${GREEN}${BOLD}Stage consolidated successfully.${NC}"
echo -e "Active seed:     ${BOLD}$SEED_DIR/${NC}"
echo -e "Archive copy:    ${BOLD}$ARCHIVE_DIR/${NC}"
echo -e "Manifest:        ${BOLD}$MANIFEST${NC}"
if [ -n "$DATAFLOW_COUNTS" ]; then
    echo -e "\n${CYAN}Dataflow-related tables:${NC}"
    echo -e "$DATAFLOW_COUNTS"
fi
echo ""
echo -e "${YELLOW}Next steps:${NC}"
echo "  1. Review db_seed/ contents"
echo "  2. git add db_seed/ && git commit -m \"consolidate stage: $STAGE_NAME\""
echo "  3. Students run deploy.ps1 / deploy.sh — restore.sh will load this snapshot"
