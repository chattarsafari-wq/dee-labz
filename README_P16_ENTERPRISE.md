# Dee Labz P16 — Enterprise

Enterprise capabilities added to the P15 Advanced Analytics build:

- Multi-branch tenant administration using the existing branch model and analytics dimensions.
- Custom branding: brand name, logo URL, favicon URL, primary/accent colors, report header/footer.
- Custom report templates stored per tenant, with safe token replacement in the report viewer.
- API keys stored as SHA-512 hashes, revocable and optionally expiring.
- REST API under `/api/v1` authenticated by `X-API-Key` or Bearer API key.
- Webhooks with per-event subscriptions, HMAC SHA-256 signatures, delivery IDs, status/failure tracking and delivery logs.

## REST endpoints

`GET /api/v1/me`
`GET /api/v1/patients`
`GET /api/v1/patients/{patient}`
`GET /api/v1/tests`
`GET /api/v1/bookings`
`GET /api/v1/bookings/{booking}`
`GET /api/v1/analytics?from=YYYY-MM-DD&to=YYYY-MM-DD`

## Webhook events

`booking.created`, `booking.status_updated`, `payment.recorded`, `report.issued` and `*` are supported.

## Security

All enterprise web routes are tenant-scoped and restricted to users with `roles.manage`. API requests derive their tenant from the API key, never from a client-supplied lab ID.
