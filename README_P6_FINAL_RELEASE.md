# Dee Labz — P6 Final Release Candidate

P6 consolidates P0–P5 into one clean release candidate. It is intended to be the baseline for runtime QA and production deployment.

## Included

- Multi-tenant laboratory workflow
- RBAC and tenant policies
- Patient, booking, sample and barcode workflow
- Technician result entry
- Pathologist review and approval
- Reference ranges and critical-value workflow
- Report release, PDF generation, QR verification and report versioning
- Billing/payment infrastructure and signed payment webhooks
- Patient portal with login throttling and audit logging
- Notification tenant isolation and permission checks
- Inventory/QC/collection-center foundations
- API/webhook foundations
- Health/readiness endpoints
- Backup/restore tooling
- Queue/scheduler deployment examples
- P5 QA/release checks

## Runtime release gate

This source has been statically validated, but production readiness is **not** asserted until a real Laravel environment is executed.

```bash
composer install --no-dev --prefer-dist --optimize-autoloader
cp .env.example .env
php artisan key:generate
php artisan migrate:fresh --seed
php artisan storage:link
php artisan test
php artisan app:production-check
php artisan optimize
```

Then execute the browser/API workflow:

1. Create Lab A and Lab B.
2. Confirm cross-tenant patient/booking/sample/report/API access is denied.
3. Complete patient → booking → sample → result → critical acknowledgement → approval → report.
4. Generate/download PDF and verify QR.
5. Record payment and replay the payment webhook to verify idempotency.
6. Login to patient portal and verify only that patient's reports are visible.
7. Amend a released report and verify version history/integrity hash.
8. Run queue and scheduler.
9. Backup the database, restore to a clean database, and repeat smoke tests.

## Production invariants

- `APP_DEBUG=false`
- HTTPS enabled
- `.env` and secrets never committed
- Production database credentials are unique
- Queue worker is supervised
- Scheduler runs every minute
- Backups are encrypted/secured and restore-tested
- Error monitoring is configured
- Demo credentials are disabled
- Patient data is never accessed outside tenant/permission checks

## Release status

**Static release candidate:** PASS

**Runtime integration QA:** PENDING environment execution

Do not label the system production-ready until the runtime release gate above passes.
