# Dee Labz P5 — Full QA / End-to-End Checklist

## Automated regression

Run:

```bash
composer install
php artisan key:generate
php artisan migrate:fresh --seed
php artisan test
```

The P5 suite covers:
- health endpoint
- guest access controls
- protected patient/billing/pathologist areas
- security headers
- health endpoint secret leakage

## End-to-end clinical workflow

Verify with two separate laboratory tenants:

1. Reception creates a patient.
2. Reception creates a booking.
3. Booking contains the expected tests.
4. Sample is collected and barcode is generated.
5. Sample is received by the laboratory.
6. Technician can see only permitted samples.
7. Technician enters required result parameters.
8. Result completion advances the workflow.
9. Pathologist reviews the result.
10. Pathologist approves the result.
11. Report becomes printable/releasable only after approval.
12. Report contains patient, test, result, reference range and verification information.
13. Released report is immutable or requires the defined correction workflow.
14. Invoice is generated.
15. Payment is recorded transactionally.
16. Invoice balance/status is correct after payment.

## Tenant isolation

With Lab A and Lab B:

- Lab A cannot open Lab B patient URLs.
- Lab A cannot open Lab B bookings.
- Lab A cannot open Lab B samples.
- Lab A cannot open Lab B results.
- Lab A cannot open Lab B reports.
- Lab A cannot open Lab B invoices.
- Lab A cannot access Lab B audit logs.
- Search/filter endpoints do not leak records across tenants.

## Role matrix

Verify:

- Reception: patient/booking operations only.
- Technician: sample/result entry, no final approval.
- Pathologist: result review/approval.
- Billing: invoice/payment operations.
- Administrator: tenant/user/role management.
- Unauthorized actions return 403/redirect rather than silently succeeding.

## Billing

Verify:

- Payment cannot exceed the outstanding amount.
- Two simultaneous payments cannot corrupt the balance.
- Invoice totals remain consistent.
- Payment is auditable.
- Invoice number remains unique.

## Barcode

Verify:

- Barcode is unique per sample.
- Label contains the sample identifier.
- Reprinting does not create a new sample.
- Invalid/unknown barcode cannot expose another tenant's data.

## Production deployment

Before release:

- `APP_DEBUG=false`
- `APP_ENV=production`
- real `APP_KEY`
- secure DB credentials
- HTTPS enabled
- queue worker running
- scheduler running
- backups configured
- restore procedure tested
- writable `storage/` and `bootstrap/cache/`
- logs monitored
- no `.env` committed
- no demo password enabled

## Browser QA

Test at minimum:

- Chrome desktop
- Firefox desktop
- Edge desktop
- mobile/tablet responsive layouts

Test:

- login/logout
- patient CRUD
- booking creation
- sample/barcode screens
- result entry
- pathologist approval
- report print
- invoice/payment
- notifications
- audit log
