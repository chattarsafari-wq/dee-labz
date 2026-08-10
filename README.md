# Dee Labz — Laravel Pathology Lab SaaS Starter

This project is a **Laravel + MySQL rewrite/foundation** based on the domain workflows found in the supplied PathLab repository. It is not a line-by-line Java-to-PHP conversion.

## Included now
- Laravel 12 foundation
- MySQL configuration
- Multi-tenant `labs` table
- `lab_id` isolation foundation on users, patients, tests and workflow tables
- Session login
- Lab admin demo account
- Dashboard
- Patient CRUD
- Test catalog CRUD
- Test parameters table
- Booking, booking_tests, samples, test_results, reports, payments and audit_logs schema
- Seeded demo laboratory and sample data

## Optional demo login
For a disposable local/demo environment, set `SEED_DEMO=true` and provide `DEMO_ADMIN_PASSWORD` (minimum 12 characters) before running `php artisan migrate --seed`. The demo email defaults to `admin@deelabz.com`. Do not enable demo seeding in production.

## Run locally
1. Install PHP 8.2+ and Composer.
2. Create MySQL database named `deelabz` (or change `.env`).
3. Copy `.env.example` to `.env`.
4. Run:
   ```bash
   composer install
   php artisan key:generate
   php artisan migrate --seed
   php artisan serve
   ```
5. Open `http://127.0.0.1:8000`.

## Important
The schema is intentionally a SaaS-ready foundation. The remaining production modules should be built in phases: bookings/orders, barcode/sample workflow, result entry, pathologist verification, PDF reports, billing/subscriptions, notifications, permissions, and a Super Admin tenant-management panel.

## P0 integration cleanup
The current release uses one canonical test catalog (`tests` + `test_parameters`), one patient schema, one sample schema, one billing schema, and one report schema. Duplicate migrations/routes from earlier module iterations have been removed. Route-level permissions are enforced through the `permission` middleware, and the distributed package does not contain a `.env` file.
