# Dee Labz — Patient Management & History Module

Features:
- Patient registration
- Automatic patient number
- Demographics
- DOB
- Gender
- Phone/email
- CNIC
- Blood group
- Emergency contact
- Address and notes
- Search by name, patient number or phone
- Edit patient profile
- Complete patient profile
- Visit/booking history
- Test count per visit
- Billing/invoice history
- Outstanding dues
- Report history
- Lab/tenant isolation

No migration is added if the existing `patients` table already contains these common fields. If the current project has a smaller patients table, add the missing columns before running the module.

Run:

```powershell
php artisan serve
```

Open:

```text
http://127.0.0.1:8000/patients
```
