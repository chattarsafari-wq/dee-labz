# P7 — Collection Center + QR Verification

## Collection Centers
Added a standalone tenant-scoped Collection Center module.

Each center supports:
- unique center code per laboratory
- name/contact/address/city
- active/inactive status
- searchable listing
- center assignment to patients/bookings/samples
- center-specific sample dispatch fields
- center users pivot

## Sample movement
The schema supports:

Collection Center -> dispatch -> Main Lab -> receive -> testing.

## QR verification
A public, read-only report verification route is included. It is intended to be wired to
the existing report verification token and should expose only released report data.

## Permission
The module uses:
`collection_center.manage`

Seed the permission using:
`php artisan db:seed --class=CollectionCenterPermissionSeeder`

## Migration
Run:
`php artisan migrate --force`

Then test:
- create center
- assign patient/booking/sample to center
- dispatch sample
- receive sample at main lab
- verify tenant isolation
- scan report QR
