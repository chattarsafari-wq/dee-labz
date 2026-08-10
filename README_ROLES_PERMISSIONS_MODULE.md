# Dee Labz — Roles & Permissions Module

Roles:
- Lab Admin
- Receptionist
- Technician
- Pathologist
- Cashier

Permissions:
- Dashboard
- Patients
- Bookings
- Samples
- Result Entry
- Result Approval
- Report Release
- Test Management
- Billing
- User Management
- Role Management
- Audit Logs

The module provides:
- Role/permission database
- Role-permission assignment
- User-role assignment tables
- `hasRole`, `hasAnyRole`, `hasPermission` helpers
- `permission:` route middleware
- Role management UI

Run:

```powershell
php artisan migrate
php artisan db:seed --class=RolesPermissionsSeeder
```

Important: protect sensitive routes using middleware, for example:

```php
Route::post('/technician/...', ...)->middleware('permission:results.enter');
Route::post('/pathologist/...', ...)->middleware('permission:results.approve');
Route::post('/billing/...', ...)->middleware('permission:billing.manage');
```

Super Admin should remain outside tenant roles and be implemented separately for global SaaS administration.
