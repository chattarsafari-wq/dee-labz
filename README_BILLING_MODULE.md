# Dee Labz — Billing & Payments Module

Features:
- Invoice automatically generated from booking tests
- Test price based subtotal
- Discount
- Tax
- Total / paid / due calculation
- Unpaid / partial / paid status
- Cash, card, bank transfer, online and other payment methods
- Payment reference number
- Payment history
- Receipt
- Print / Save as PDF
- Tenant isolation by `lab_id`

Install:

```powershell
php artisan migrate
php artisan serve
```

Create an invoice for a booking:

```text
/billing/bookings/{booking}/create
```

Then receive one or multiple payments until the invoice becomes `paid`.

Recommended production improvement:
- Add immutable invoice numbering/audit trail.
- Add refund/void workflow.
- Add tax rules and configurable currency.
- Add payment gateway integration only after the core cash/receipt workflow is stable.
