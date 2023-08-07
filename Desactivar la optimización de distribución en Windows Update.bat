@echo off
title - https://github.com/OtaconEvil

REM --- Desactivar la optimización de distribución en Windows Update ---

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" /v "DODownloadMode" /t REG_DWORD /d 0 /f

echo La optimización de distribución en Windows Update ha sido desactivada.
pause
