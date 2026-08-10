# Dee Labz — Dashboard & Analytics Module

Adds a lab-admin dashboard with:
- Today's bookings
- Today's patients
- Pending results
- Approved results today
- Reports released today
- Today's revenue
- Total revenue
- Outstanding dues
- Pending invoices
- Recent bookings
- Recent payments
- Top tests
- Result workflow summary

Run:

```powershell
php artisan serve
```

Then open:

```text
http://127.0.0.1:8000/dashboard
```

No new migration is required because the dashboard reads the existing tables.
