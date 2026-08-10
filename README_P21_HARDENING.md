# Dee Labz — P21 Hardening

This release fixes the remaining code-level issues identified during the P20 review.

## Fixed

- Removed stray PHP import before the `routes/web.php` opening tag.
- Enforced booking completion requirements: all samples completed and all required parameters populated.
- Restricted booking status changes to legal workflow transitions.
- Locked result editing after approval, release, or cancellation.
- Reopened completed samples during pathologist correction so rejected results can be corrected without duplicate samples.
- Added database uniqueness for one sample per lab/booking/test.
- Fixed SaaS quota bypass when reactivating users, branches, or collection centers.
- Added dedicated branch and referral-doctor management permissions.
- Hardened barcode status changes through the same sample workflow rules.
- Added native browser camera barcode/QR detection where `BarcodeDetector` is supported.
- Added explicit lab receipt timestamp/user fields for collection-center sample receiving.
- Kept notification phone routing on `patients.contact_number`.
- Kept API patient phone search on `patients.contact_number`.
- Added P21 static hardening tests.

## Runtime gate

Static PHP syntax validation passes. A full Laravel runtime suite still requires:

1. `composer install`
2. a configured database
3. `.env` / application key
4. `php artisan migrate:fresh --seed`
5. `php artisan test`
6. provider credentials for payment/SMS/WhatsApp and any analyzer integration

External integrations are therefore not falsely marked as live in this release.
