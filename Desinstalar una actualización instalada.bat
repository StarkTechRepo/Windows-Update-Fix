@echo off
REM --- Verificar si el script se está ejecutando como administrador ---
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto :continue ) else ( goto :getadmin )
:getadmin
echo UAC prompt: Solicitando permisos de administrador...
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B
:continue

REM --- Desinstalar una actualización instalada ---
:input
set /p "KB_ID=Ingresa el ID de KB de la actualización que deseas desinstalar (o deja en blanco para salir): "

if "%KB_ID%"=="" (
    set /p "choice=No has ingresado el ID de KB. ¿Deseas salir (S/N)? "
    if /i "%choice%"=="S" (
        echo Saliendo...
        exit /b
    ) else (
        goto input
    )
)

wusa /uninstall /kb:%KB_ID% /quiet /norestart
echo La actualización con el ID de KB %KB_ID% ha sido desinstalada.
pause
