# DLab Demo Credentials

These credentials are included only for the local/demo installation created by `SEED_DEMO=true`. Change all passwords before production use.

| Role | Email | Password |
|---|---|---|
| Lab Admin | admin@dlab.local | DlabAdmin@2026! |
| Receptionist | reception@dlab.local | DlabReception@2026! |
| Technician | technician@dlab.local | DlabTech@2026! |
| Pathologist | pathologist@dlab.local | DlabPath@2026! |
| Cashier | cashier@dlab.local | DlabCashier@2026! |

## Demo data

- Lab: Dee Labz Diagnostic Laboratory
- Database: `dlab`
- Demo patient: `DLAB-P0001` / Demo Patient
- Demo test: `CBC` / Complete Blood Count

## Start

1. Start MySQL.
2. Run `INSTALL_DLAB.bat` on XAMPP/Windows, or `./SETUP_DLAB_LINUX.sh` on Linux.
3. Run `php artisan serve`.
4. Open `http://127.0.0.1:8000`.

Do not use these demo passwords in a public/production deployment.
