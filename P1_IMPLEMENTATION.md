# P1 implementation

## Included
- Server-side A4 PDF report generation using `barryvdh/laravel-dompdf` 3.1.x.
- Tenant-authorized report PDF download route.
- PDF contains patient/report metadata, all test parameters, units, reference ranges, clinical notes and verification code.
- Payment gateway abstraction with manual and provider-neutral HMAC/HTTPS drivers.
- Signed payment webhook endpoint with idempotent transaction handling through existing `transaction_id` logic.
- Gateway configuration via environment variables.

## Install
Run `composer install` and then `php artisan migrate` in the normal deployment environment.

For a real payment provider, implement `App\\Contracts\\PaymentGateway` or configure the generic HMAC adapter only if the provider's API/signature contract matches it. Do not treat the generic adapter as a provider certification.

## P1 verification
- `php -l` all modified PHP files.
- Run Laravel feature tests after Composer dependencies and a MySQL database are available.
- Verify a released report downloads as PDF and that an unissued report returns 404.
- Verify invalid payment webhook signatures return 400 and valid signed webhooks are idempotent.
