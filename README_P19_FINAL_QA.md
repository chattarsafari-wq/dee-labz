# P19 Final QA — Dee Labz

## QA scope
- Fresh-install migration/seed review
- Multi-tenant isolation and IDOR-style review
- Patient → booking → sample → result → approval → report workflow
- Billing and payment controls
- QR/report verification
- Collection-center assignment and sample dispatch/receive
- Patient Portal report ownership
- SaaS subscription lifecycle
- Mobile/browser responsive audit
- Security and production regression review

## Fixed in P19
1. Collection-center migration could execute before `labs`/`users` on a fresh install. The original migration now safely defers when dependencies are absent, and migration `000020_finalize_collection_center_dependencies` completes the schema after the foundation tables exist.
2. Collection-center assignments were not persisted because `collection_center_id` was missing from Patient/Sample mass-assignment fields. Fixed.
3. QR verification route searched for token columns that do not exist in the actual report schema. It now validates the canonical `verification_code` and requires an issued report.
4. Patient Portal report queries were incorrectly based on a nonexistent `reports.patient_id`. They now scope through `booking.patient_id`.
5. Two separate commands registered `db:backup`. The duplicate command was removed so the production scheduler has one canonical backup command.
6. SaaS lifecycle now supports cancel, resume and renew actions, and inactive subscriptions are enforced on tenant application routes while SaaS billing/plans remain reachable.
7. Webhook delivery now uses the database queue worker with retry handling instead of blocking application requests.
8. API-key scopes are now enforced per REST endpoint; tenant isolation remains bound to the API key's `lab_id`.
9. Fresh demo seeding is now explicit via `SEED_DEMO=true` with a required strong password instead of silently creating a known default credential.

## Validation performed in this environment
- PHP syntax scan: **169 PHP files, 0 lint failures**
- Migration files: **35**
- Duplicate `db:backup` command: **resolved; one signature remains**
- Responsive viewport metadata: **present in authenticated/login layouts**
- Mobile CSS breakpoint audit: **present at 800px and 1100px**
- 2FA routes and session revocation routes: **present**
- REST API scope middleware: **present**
- Queue webhook job: **present**

## Runtime limitation
A full browser/HTTP/database test run could not be executed in this sandbox because the uploaded package does not include Composer `vendor/`, Composer is not installed in the execution environment, Docker is unavailable, and PHP has no MySQL/SQLite PDO driver. Therefore this release does **not** claim a live Laravel migration/test suite or real-device browser pass from this environment.

Recommended production CI gate:
```bash
composer install --no-interaction --prefer-dist
php artisan key:generate --force
php artisan migrate:fresh --seed --force
php artisan test
php artisan route:list
php artisan app:production-check
php artisan queue:work --stop-when-empty
```

For mobile/browser CI, run the authenticated smoke suite against Chrome/Chromium at desktop, tablet, and 390px-wide mobile viewports.
