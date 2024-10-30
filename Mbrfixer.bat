@echo off
setlocal

echo WARNING: This script will download and execute Rufus to replace the Master Boot Record (MBR).
echo This action may result in data loss or make the disk unbootable.
echo Ensure you have a complete backup of your data before proceeding.

set /p "disk=Enter the disk number (e.g., 0 for the first disk): "

:: Define the Rufus download URL
set "rufus_url=https://rufus.ie/downloads/rufus-3.19.exe"
set "rufus_file=rufus.exe"

:: Download Rufus
echo Downloading Rufus...
powershell -Command "Invoke-WebRequest -Uri %rufus_url% -OutFile %rufus_file%"

if %errorlevel% neq 0 (
    echo ERROR: Failed to download Rufus. Exiting.
    exit /b
)

:: Execute Rufus with command line options (requires administrative privileges)
echo Running Rufus...
start "" %rufus_file% --format --mbr --device \\.\PhysicalDrive%disk%

echo.
echo WARNING: Make sure to reinstall the bootloader for the OS on this disk if necessary.

:: Optional cleanup of the downloaded file
:: del %rufus_file%

pause
