# Dee Labz — Pathologist Verification & Approval Module

Workflow:

Technician Result → Pathologist Review → Approve OR Reject → Report Release

Features:
- Pathologist dashboard
- Booking-level result review
- Patient/test/reference range display
- Result approval status
- Approve all available results for a booking
- Record pathologist and approval timestamp
- Approval note
- Reject/request correction with mandatory reason
- Booking status becomes `approved` or `correction_required`
- Tenant isolation through `lab_id`

After replacing the project:

```powershell
composer install
php artisan migrate
php artisan serve
```

For a fresh database:

```powershell
php artisan migrate --seed
```

Recommended next change: make the Report page refuse final release until every required result is approved.
