# Dee Labz Windows startup

If Chrome shows `ERR_CONNECTION_REFUSED` for `127.0.0.1:8000`, the Laravel server is not running. Chrome itself is not the problem.

## Correct order

1. Start XAMPP MySQL.
2. Run `INSTALL_DLAB.bat` once and wait for `INSTALLATION COMPLETE`.
3. Confirm that the folder contains `vendor\\autoload.php`.
4. Double-click `START_DLAB.bat`.
5. A black server window should stay open and show `Server running on http://127.0.0.1:8000`.
6. Then open `http://127.0.0.1:8000`.

`START_DLAB.bat` is included in this ZIP; it no longer depends on the installer generating it.

If startup reports that Laravel cannot boot, run `INSTALL_DLAB.bat` again and use the error shown in that window.
