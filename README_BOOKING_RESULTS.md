# Dee Labz — Booking & Result Module

This update adds a working pathology workflow on top of the Laravel starter:

Patient → Booking → Selected Tests → Samples/Barcodes → Result Entry → Completed Booking

## Routes
- `/bookings` — booking list
- `/bookings/create` — create booking
- `/bookings/{id}` — booking details, samples and results
- `/bookings/{id}/results` — enter/edit test parameters
- `/bookings/{id}/status` — update booking status

## Run
From the project root:

```powershell
composer install
copy .env.example .env
php artisan key:generate
php artisan migrate --seed
php artisan serve
```

Demo:
- Email: `admin@deelabz.com`
- Password: `password`

## Important
The result screen only allows parameters belonging to the tests actually booked for the current tenant. Booking, sample and result records all carry `lab_id`.
