@echo off

echo WARNING: This script will replace the current Master Boot Record (MBR) on the specified disk with a new MBR.
echo This action may result in data loss or make the disk unbootable.
echo Ensure you have a complete backup of your data before proceeding.

set /p "disk=Enter the disk number (e.g., 0 for the first disk): "
set /p "mbr_file=Enter the path to the new MBR binary file (must be 512 bytes): "

echo Replacing the MBR on Disk %disk%...
echo WARNING: This will overwrite the current MBR.

:: Use the 'dd' command to write the new MBR to the disk
dd if="%mbr_file%" of=\\.\PhysicalDrive%disk% bs=512 count=1

if %errorlevel% equ 0 (
    echo New MBR successfully written to Disk %disk%.
) else (
    echo An error occurred while writing the new MBR to Disk %disk%.
)

echo.
echo WARNING: Make sure to reinstall the bootloader for the OS on this disk.

pause
