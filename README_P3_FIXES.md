# Dee Labz P3 — Security & Production Hardening

This pass hardens the P1-cleaned Laravel application for safer deployment.

## Included

- Login throttling by email/IP with a short lockout window.
- Security response headers on application responses.
- HSTS automatically when the request is HTTPS.
- Audit logs now capture IP address and user agent.
- Production `.env.example` defaults `APP_DEBUG=false`.
- Added secure-cookie configuration guidance.
- Added regression tests for the security configuration and headers.
- PHP syntax validation completed successfully.

## Deployment notes

1. Copy `.env.example` to `.env`.
2. Generate an application key with `php artisan key:generate`.
3. Use HTTPS and set `SESSION_SECURE_COOKIE=true` in production.
4. Set `APP_DEBUG=false` outside local development.
5. Run migrations before serving the application.
6. Run the PHPUnit suite after installing Composer dependencies.
