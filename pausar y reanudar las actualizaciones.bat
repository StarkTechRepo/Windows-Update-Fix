@echo off
title - https://github.com/OtaconEvil

REM --- Menú para pausar y reanudar las actualizaciones ---

:menu
cls
echo.
echo    ===================================================
echo    |                Menú de Actualizaciones             |
echo    ===================================================
echo    | 1. Pausar Actualizaciones                         |
echo    | 2. Reanudar Actualizaciones                       |
echo    | 3. Salir                                          |
echo    ===================================================
echo.

set /p "opcion=Selecciona una opción (1, 2 o 3): "

if "%opcion%"=="1" (
    REM --- Pausar las actualizaciones ---
    net stop wuauserv >nul
    echo.
    echo Actualizaciones pausadas. Presiona cualquier tecla para volver al menú...
    echo.
    pause >nul
    goto menu
) else if "%opcion%"=="2" (
    REM --- Reanudar las actualizaciones ---
    net start wuauserv >nul
    echo.
    echo Actualizaciones reanudadas exitosamente. Presiona cualquier tecla para volver al menú...
    echo.
    pause >nul
    goto menu
) else if "%opcion%"=="3" (
    echo.
    echo Saliendo...
    echo.
    exit /b
) else (
    echo.
    echo Opción no válida. Presiona cualquier tecla para volver al menú...
    echo.
    pause >nul
    goto menu
)
