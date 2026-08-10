# Dee Labz — Final Report & Verification Module

Features:
- Final report generation from approved results
- Required-parameter validation before release
- Unique report number per lab
- Unique verification code
- Issued timestamp and issuing user
- Clinical/laboratory notes
- Professional report page
- Browser Print / Save as PDF
- Public verification page
- Report history

Install:

```powershell
php artisan migrate
php artisan serve
```

Report release route:

```text
GET  /reports
GET  /reports/bookings/{booking}
POST /reports/bookings/{booking}/issue
GET  /verify-report/{code}
```

Important:
The verification page intentionally exposes only basic authenticity information, not the patient's full clinical results. This is safer for a public QR verification workflow.

For a real QR image inside the PDF/report, add a QR package later (for example a maintained QR-code library) and render the verification URL in the report template.
