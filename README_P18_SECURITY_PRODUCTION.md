# P18 — Security + Production

Added enterprise production controls:
- TOTP 2FA with recovery codes and authenticator URI
- Database-backed session/device listing and revocation
- Named middleware rate limiting with response headers
- Scheduled compressed MySQL backups with retention
- Database queue worker + scheduler in Docker, failed-job tracking
- Monitoring endpoint and scheduler heartbeat
- Persistent error tracking with fingerprint/occurrence aggregation
- Automated security regression tests
- Security headers, secure session defaults, production environment guidance

Production checklist:
1. Set APP_ENV=production and APP_DEBUG=false.
2. Set SESSION_DRIVER=database, SESSION_ENCRYPT=true, SESSION_SECURE_COOKIE=true.
3. Use Redis or database cache/queue as appropriate and run queue workers.
4. Configure off-host backup storage; local backups alone are not disaster recovery.
5. Put HTTPS and a reverse proxy/WAF in front of the app.
6. Run `php artisan migrate --force`, `php artisan optimize`, and `php artisan test` during deployment.
