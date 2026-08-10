# Dee Labz — Sample Collection & Barcode Module

Features:
- Sample record linked to booking and patient
- Auto sample number
- Unique barcode identifier
- Sample type and container
- Collection notes
- Collection by user and timestamp
- Laboratory receiving by user and timestamp
- Status workflow:
  pending → collected → received → processing → completed
  pending/rejected → collected
- Rejection reason
- Search by sample, barcode or patient
- Status filtering
- Sample timeline

Install:

```powershell
php artisan migrate
php artisan serve
```

Open:

```text
http://127.0.0.1:8000/samples
```

To create a sample for a booking:

```text
/samples/bookings/{booking}/create
```

The generated `barcode` is a unique identifier. The next enhancement can render this identifier as an actual scannable Code 128 / QR image and connect scanning directly to the sample lookup screen.
