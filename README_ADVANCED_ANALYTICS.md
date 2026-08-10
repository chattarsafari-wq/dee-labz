# Advanced Analytics — Dee Labz

This release adds a tenant-isolated analytics workspace covering:

- Revenue: collected revenue, invoiced amount, outstanding due, collection rate, average revenue per booking and period comparison.
- Profit/cost: recorded operating costs, cost breakdown, operating profit and branch-level profitability.
- Test volume: daily test volume, top tests, billed revenue per test and period comparison.
- Collection-center performance: bookings, tests, revenue, sample rejection rate and average collection-to-receipt turnaround.
- Doctor referrals: referral bookings, test volume and collected revenue by referring doctor.
- Branch analytics: bookings, test volume, revenue, recorded costs, profit and average ticket.
- Date filtering: any custom date range with a previous-period comparison.
- Cost capture: lab-wide or branch-specific operating cost entries.

## Data model additions

- `branches`
- `referral_doctors`
- `operating_costs`
- `bookings.branch_id`
- `bookings.referral_doctor_id`

Existing tenants receive a `MAIN` / `Main Branch` record automatically during migration. Existing bookings remain valid and appear under **Unassigned** until a branch/doctor/collection-center assignment is recorded.

## Important accounting note

Operating profit is calculated as:

`collected revenue - recorded operating costs`

It is not a full statutory accounting profit calculation. Inventory consumption, payroll accruals, depreciation, tax accounting and supplier reconciliation are outside this module unless separately recorded as operating costs.

## Setup

```bash
php artisan migrate
php artisan db:seed --class=RolesPermissionsSeeder
```

Users with `analytics.view` can access `/analytics`. Users with `analytics.costs.manage` can record and remove operating costs.

Booking creation now captures optional branch, collection center and referral doctor dimensions so future analytics are attributable at source.
