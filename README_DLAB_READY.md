# Dee Labz Ready Package

This package is configured for a MySQL database named `dlab` and includes an explicit local demo seed.

It creates one demo laboratory, five role-based demo users, a demo patient, and a CBC test with two required parameters.

See `DLAB_CREDENTIALS.md` for login credentials and `SETUP_DLAB_WINDOWS.bat` / `SETUP_DLAB_LINUX.sh` for setup.

Before production: set `SEED_DEMO=false`, replace all demo credentials, use HTTPS, configure a real mail/SMS/WhatsApp/payment provider, and review `.env` secrets.
