#!/usr/bin/env bash
set -e
cd "$(dirname "$0")"

command -v php >/dev/null || { echo "PHP is required."; exit 1; }
command -v composer >/dev/null || { echo "Composer is required."; exit 1; }
command -v mysql >/dev/null || { echo "MySQL client is required."; exit 1; }

read -rsp "MySQL root password (press Enter if blank): " MYSQLPASS; echo
if [ -z "$MYSQLPASS" ]; then mysql -u root < database/create_dlab.sql; else mysql -u root -p"$MYSQLPASS" < database/create_dlab.sql; fi

composer install
[ -f .env ] || cp .env.example .env
php artisan key:generate --force
php artisan migrate:fresh --seed
echo
echo "DLab is ready: http://127.0.0.1:8000"
echo "Admin: admin@dlab.local"
echo "Password: DlabAdmin@2026!"
echo
