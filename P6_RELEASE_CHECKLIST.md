# P6 Release Checklist

## Installation
- [ ] Composer install succeeds
- [ ] `.env` configured
- [ ] APP_KEY generated
- [ ] Migrations succeed on an empty database
- [ ] Seeders succeed
- [ ] Storage link succeeds

## Security
- [ ] Tenant A cannot access Tenant B patient data
- [ ] Tenant A cannot access Tenant B reports
- [ ] Tenant A cannot access Tenant B invoices
- [ ] Tenant A cannot access Tenant B samples
- [ ] Tenant A cannot access Tenant B notifications
- [ ] API keys are tenant-isolated
- [ ] Portal login throttling works
- [ ] QR verification throttling works
- [ ] Payment webhook signature validation works

## Clinical workflow
- [ ] Patient creation
- [ ] Booking creation
- [ ] Sample collection
- [ ] Barcode workflow
- [ ] Technician result entry
- [ ] Reference-range classification
- [ ] Critical result detection
- [ ] Critical acknowledgement
- [ ] Pathologist approval
- [ ] Report release
- [ ] PDF generation
- [ ] QR verification
- [ ] Report amendment/versioning

## Billing
- [ ] Invoice creation
- [ ] Payment recording
- [ ] Duplicate webhook is idempotent
- [ ] Failed payment is handled
- [ ] Receipt is correct

## Operations
- [ ] Queue worker runs
- [ ] Scheduled jobs run
- [ ] `/health/live` returns 200
- [ ] `/health/ready` returns 200 with a healthy database
- [ ] Readiness returns 503 when DB is unavailable
- [ ] Backup succeeds
- [ ] Restore succeeds

## Final gate
- [ ] PHPUnit/feature suite passes
- [ ] Browser/E2E suite passes
- [ ] No critical/high security findings remain
- [ ] Production smoke test passes
- [ ] Rollback plan tested
