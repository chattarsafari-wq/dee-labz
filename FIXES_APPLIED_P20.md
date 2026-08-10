# Dee Labz P20 — Fixes Applied

## Production blockers fixed
- Consolidated `audit_logs` into one canonical migration.
- Made the legacy security-context migration a no-op so migration ordering is safe.
- Removed the duplicate `audit_logs` rollback from the booking workflow migration.
- Added patient/auditable/security metadata fields to the canonical audit table.
- Fixed `AuditLog` mass-assignment/casting for `patient_id` and `metadata`.

## Workflow fixes
- Booking-level result entry now requires all samples to be received/processing.
- Booking-level result entry can no longer mark a booking completed.
- Booking status UI now exposes only statuses supported by its manual-status endpoint.
- Prevented duplicate active samples for the same booking/test while allowing a rejected sample to be replaced.
- Fixed patient gender values in result/reference-range Blade views (`male`/`female`).

## Notification/API fixes
- SMS and WhatsApp recipient resolution now uses the actual patient `contact_number` field.
- API patient search now searches `contact_number`.

## Authorization fixes
- Added permissions for QC, sample tracking, inventory and SaaS billing.
- Protected P14/P15 operational routes with the appropriate permissions.
- Protected SaaS subscription/billing operations with SaaS billing permissions.
- Added staff/user management with tenant-scoped role assignment.
- Added Staff navigation for users with `users.manage`.

## SaaS quota enforcement
- Added `saas.limit` middleware.
- Enforced plan quotas for active users, patients, collection centers and branches on create operations.

## Patient portal
- Report detail endpoint now renders a patient-safe report view instead of returning the complete Report model as raw JSON.
- Patient portal report list now uses `report_no` and `issued_at`.
- Only approved result rows are displayed in the report detail view.

## Validation performed
- PHP syntax lint across application, migrations, routes and Blade templates: PASS.
- Canonical `audit_logs` create migration count: 1.
- Static checks for old patient phone fields: PASS.
- Static checks for old gender `M/F` comparisons: PASS.

## Not fully runtime-verified in this environment
The package does not contain `vendor/`, and a live MySQL database/provider credentials are not available here. Therefore `composer install`, `php artisan migrate:fresh --seed`, browser workflows, payment/SMS/WhatsApp provider calls, analyzer connections and end-to-end HTTP tests still need to be run in a real deployment environment.
