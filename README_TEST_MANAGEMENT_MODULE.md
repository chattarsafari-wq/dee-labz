# Dee Labz — Test & Parameter Management Module

Features:
- Test catalog
- Unique test code per lab
- Test name/category
- Price in PKR
- Turnaround time
- Active/inactive status
- Instructions
- Test parameters
- Units
- Male/Female/Child reference ranges
- Method
- Sort order
- Required flag
- Add/edit/delete parameters
- Tenant isolation by lab_id

Run:

```powershell
php artisan migrate
php artisan serve
```

This module uses the canonical `tests` and `test_parameters` tables. Test parameters reference `tests.id` via `test_id`.
