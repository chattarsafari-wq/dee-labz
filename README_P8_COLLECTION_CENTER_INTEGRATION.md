# P8 — Collection Center End-to-End Integration

P8 extends P7 so collection centers are no longer only CRUD records.

## Added
- Collection Center dashboard
- Patient assignment to center
- Booking assignment to center
- Sample dispatch from center
- Sample receipt at main lab
- Tenant-scoped workflow actions
- Center-specific workflow routes
- Model relationships for patient/booking/sample
- QR verification now resolves an existing report token and only exposes released/approved reports
- Collection Center dashboard with recent patient/booking/sample activity

## Workflow

Patient
→ Collection Center
→ Booking
→ Sample Collection
→ Barcode
→ Dispatch
→ Main Lab Receive
→ Technician
→ Pathologist
→ Release Report
→ QR Verification

## Required validation
Run:
`php artisan migrate --force`
`php artisan db:seed --class=CollectionCenterPermissionSeeder`
`php artisan test`
