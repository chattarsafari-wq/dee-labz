# Dee Labz P4 — Testing & Deployment Readiness

P4 adds the production-operational layer around the P0–P3 application cleanup.

## Included

- Database-backed queue tables (`jobs`, `job_batches`, `failed_jobs`).
- `app:health` CLI health check and `/health` JSON endpoint.
- Scheduled daily database backups at 02:30 (server timezone).
- `db:backup` and `db:restore` commands for MySQL/PostgreSQL.
- Docker image and `docker-compose.yml` with app, queue worker, scheduler, and MySQL.
- Production deployment, backup, and restore scripts.
- Container health checks and restart policies.
- Composer production install and Laravel optimization in the container build.

## Local verification

```bash
cp .env.example .env
php artisan key:generate
php artisan migrate --seed
php artisan app:health
php artisan test
```

## Docker

```bash
cp .env.example .env
# Change DB_PASSWORD, DB_ROOT_PASSWORD and other production secrets.
docker compose up -d --build
docker compose exec app php artisan migrate --seed
docker compose exec app php artisan app:health
```

## Backup / restore

```bash
php artisan db:backup
php artisan db:restore storage/app/backups/deelabz_YYYYMMDD_HHMMSS.sql.gz --force
```

Backups contain patient, result, report and billing data. Store them encrypted and outside the application host in production. Test restores regularly.

## Production requirements

- Put the application behind HTTPS and a reverse proxy/load balancer.
- Use strong, unique database credentials and `APP_KEY`.
- Set `APP_ENV=production`, `APP_DEBUG=false`, and `SESSION_SECURE_COOKIE=true`.
- Run queue workers under a process supervisor/container orchestrator.
- Send backups to separate durable storage.
- Monitor `/health` and Laravel logs.
- Do not commit `.env` or backup files.
