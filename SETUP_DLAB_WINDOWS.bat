@echo off
setlocal EnableExtensions EnableDelayedExpansion
cd /d "%~dp0"
color 0A

echo.
echo ================================================================
echo                 DLAB - WINDOWS INSTALLER
echo ================================================================
echo.

echo [1/7] Checking PHP...
set "PHP_EXE="
if exist "C:\xampp\php\php.exe" set "PHP_EXE=C:\xampp\php\php.exe"
if not defined PHP_EXE for /f "delims=" %%P in ('where php 2^>nul') do if not defined PHP_EXE set "PHP_EXE=%%P"
if not defined PHP_EXE (
  echo [ERROR] PHP not found.
  echo Install XAMPP or add PHP to PATH.
  goto :FAIL
)
echo [OK] PHP: %PHP_EXE%


echo.
echo [2/7] Checking MySQL...
set "MYSQL_EXE="
if exist "C:\xampp\mysql\bin\mysql.exe" set "MYSQL_EXE=C:\xampp\mysql\bin\mysql.exe"
if not defined MYSQL_EXE for /f "delims=" %%M in ('where mysql 2^>nul') do if not defined MYSQL_EXE set "MYSQL_EXE=%%M"
if not defined MYSQL_EXE (
  echo [ERROR] mysql.exe not found.
  echo Start XAMPP MySQL and/or add MySQL to PATH.
  goto :FAIL
)
echo [OK] MySQL: %MYSQL_EXE%


echo.
echo [3/7] Checking Composer...
set "COMPOSER_CMD="
where composer >nul 2>nul
if not errorlevel 1 set "COMPOSER_CMD=composer"
if not defined COMPOSER_CMD if exist "%~dp0composer.phar" set "COMPOSER_CMD=%PHP_EXE% "%~dp0composer.phar""
if not defined COMPOSER_CMD (
  echo [ERROR] Composer not found in PATH.
  echo Install Composer, then run this installer again.
  echo https://getcomposer.org/download/
  goto :FAIL
)
echo [OK] Composer found.


echo.
echo [4/7] Creating database: dlab
set "MYSQLPASS="
set /p "MYSQLPASS=Enter MySQL root password (press Enter if blank): "
if defined MYSQLPASS (
  "%MYSQL_EXE%" -u root -p%MYSQLPASS% < "%~dp0database\create_dlab.sql"
) else (
  "%MYSQL_EXE%" -u root < "%~dp0database\create_dlab.sql"
)
if errorlevel 1 (
  echo [ERROR] Could not create database dlab.
  echo Make sure MySQL is running in XAMPP.
  goto :FAIL
)
echo [OK] Database dlab is ready.


echo.
echo [5/7] Installing PHP dependencies...
if not exist "%~dp0vendor\autoload.php" (
  call %COMPOSER_CMD% install --no-interaction --prefer-dist
  if errorlevel 1 (
    echo [ERROR] Composer install failed.
    goto :FAIL
  )
) else (
  echo [OK] vendor directory already exists. Skipping composer install.
)


echo.
echo [6/7] Configuring Laravel and database...
if not exist "%~dp0.env" copy /Y "%~dp0.env.example" "%~dp0.env" >nul
if errorlevel 1 (
  echo [ERROR] Could not create .env
  goto :FAIL
)

set "ENVFILE=%~dp0.env"
set "DLAB_DB_PASS=%MYSQLPASS%"
"%PHP_EXE%" -r "$p='.env'; if(file_exists($p)){ $s=file_get_contents($p); $s=preg_replace('/^DB_DATABASE=.*$/m','DB_DATABASE=dlab',$s); $s=preg_replace('/^DB_USERNAME=.*$/m','DB_USERNAME=root',$s); $s=preg_replace('/^DB_PASSWORD=.*$/m','DB_PASSWORD='.getenv('DLAB_DB_PASS'),$s); file_put_contents($p,$s); }" 2>nul

"%PHP_EXE%" artisan key:generate --force
if errorlevel 1 (
  echo [ERROR] Laravel key generation failed.
  goto :FAIL
)

"%PHP_EXE%" artisan optimize:clear
if errorlevel 1 goto :FAIL

"%PHP_EXE%" artisan migrate:fresh --seed --force
if errorlevel 1 (
  echo [ERROR] Migration/seed failed.
  goto :FAIL
)


echo.
echo [7/7] Creating start script...
>"%~dp0START_DLAB.bat" echo @echo off
>>"%~dp0START_DLAB.bat" echo cd /d "%%~dp0"
>>"%~dp0START_DLAB.bat" echo echo Starting Dee Labz...
>>"%~dp0START_DLAB.bat" echo start "DLab Laravel Server" cmd /k "php artisan serve --host=127.0.0.1 --port=8000"
>>"%~dp0START_DLAB.bat" echo timeout /t 2 /nobreak ^>nul
>>"%~dp0START_DLAB.bat" echo start "" http://127.0.0.1:8000

echo.
echo ================================================================
echo                    INSTALLATION COMPLETE
echo ================================================================
echo.
echo Database : dlab
echo URL      : http://127.0.0.1:8000
echo.
echo ADMIN LOGIN
echo Email    : admin@dlab.local
echo Password : DlabAdmin@2026!
echo.
echo Receptionist : reception@dlab.local / DlabReception@2026!
echo Technician   : technician@dlab.local / DlabTech@2026!
echo Pathologist  : pathologist@dlab.local / DlabPath@2026!
echo Cashier      : cashier@dlab.local / DlabCashier@2026!
echo.
echo Run START_DLAB.bat to launch the application.
echo.
pause
exit /b 0

:FAIL
echo.
echo ================================================================
echo INSTALLATION FAILED
echo ================================================================
echo Review the error above, fix it, and run INSTALL_DLAB.bat again.
echo.
pause
exit /b 1
