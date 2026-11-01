@echo off
cd /d "%~dp0"
powershell.exe -NoProfile -STA -File "%~dp0scripts\add-photos.ps1"
pause
