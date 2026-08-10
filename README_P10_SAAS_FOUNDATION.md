# P10 — SaaS Foundation

Added:
- SaaS plans: Starter, Professional, Enterprise
- Monthly/yearly pricing fields
- Trial periods
- Per-plan usage limits
- Feature flags
- Lab subscription model
- Subscription lifecycle fields
- SaaS subscription service
- Subscription-active middleware
- Plan selection UI
- Subscription status endpoint
- Lab-specific subscription relation
- Seeder for default plans

## P10 scope
Payment gateway, automated recurring charges, subscription webhooks and SaaS super-admin billing are intentionally reserved for P11.

## Install
php artisan migrate
php artisan db:seed --class=SaasPlanSeeder

Or run the normal DatabaseSeeder if it calls SaasPlanSeeder.
