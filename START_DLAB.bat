@echo off
setlocal EnableExtensions
cd /d "%~dp0"
color 0A

echo.
echo ================================================================
echo                  DLAB - START SERVER
echo ================================================================
echo.

set "PHP_EXE="
if exist "C:\xampp\php\php.exe" set "PHP_EXE=C:\xampp\php\php.exe"
if not defined PHP_EXE for /f "delims=" %%P in ('where php 2^>nul') do if not defined PHP_EXE set "PHP_EXE=%%P"

if not defined PHP_EXE (
  echo [ERROR] PHP was not found.
  echo Install XAMPP or add PHP to PATH.
  pause
  exit /b 1
)

if not exist "%~dp0vendor\autoload.php" (
  echo [ERROR] Laravel dependencies are not installed.
  echo.
  echo Run INSTALL_DLAB.bat first.
  echo.
  pause
  exit /b 1
)

if not exist "%~dp0.env" (
  echo [ERROR] .env file is missing.
  echo Run INSTALL_DLAB.bat first.
  pause
  exit /b 1
)

"%PHP_EXE%" "%~dp0artisan" about >nul 2>nul
if errorlevel 1 (
  echo [ERROR] Laravel cannot boot.
  echo Run INSTALL_DLAB.bat again and check its error output.
  pause
  exit /b 1
)

echo [OK] PHP: %PHP_EXE%
echo [OK] Laravel dependencies found.
echo.
echo Starting Laravel on http://127.0.0.1:8000 ...
echo.
echo Keep this window open while using Dee Labz.
echo Close this window to stop the server.
echo.
start "DLAB Laravel Server" cmd /k "cd /d ""%~dp0"" && ""%PHP_EXE%"" artisan serve --host=127.0.0.1 --port=8000"
timeout /t 3 /nobreak >nul
start "" http://127.0.0.1:8000
exit /b 0
