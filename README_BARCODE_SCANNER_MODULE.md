# Dee Labz — Barcode / QR Scanner Module

Features:
- Dedicated scanner screen
- USB barcode scanner support
- Manual barcode/sample-number lookup
- AJAX sample lookup without page reload
- Patient/sample/status display
- Quick status changes:
  collected → received → processing → completed
- Rejection with reason
- Direct link to full sample record
- Lab/tenant isolation

No migration is required.

Run:

```powershell
php artisan serve
```

Open:

```text
http://127.0.0.1:8000/barcode-scanner
```

A USB barcode scanner normally behaves like a keyboard: focus the input, scan, then press Enter. Camera-based scanning is intentionally left as a separate enhancement so the core workflow works without adding a browser camera dependency.
