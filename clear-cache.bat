@echo off
chcp 65001 >nul
title Limpeza de Cache do Windows - Menu (Jarvis)
color 0A

REM ==============================
REM VERIFICA ADMIN
REM ==============================
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERRO] Execute como ADMINISTRADOR.
    pause
    exit /b
)

:MENU
cls
echo ============================================
echo      LIMPEZA DE CACHE DO WINDOWS (MENU)
echo ============================================
echo.
echo [1] Limpar TEMP do Usuário (%temp%)
echo [2] Limpar TEMP do Sistema (C:\Windows\Temp)
echo [3] Limpar Prefetch (C:\Windows\Prefetch)
echo [4] Limpar Cache do Windows Update
echo [5] Limpar Cache DNS (ipconfig /flushdns)
echo [6] Esvaziar Lixeira
echo [7] Limpar TUDO
echo.
echo [0] Sair
echo.
set /p op=Escolha uma opção: 

if "%op%"=="1" goto TEMP_USER
if "%op%"=="2" goto TEMP_SYSTEM
if "%op%"=="3" goto PREFETCH
if "%op%"=="4" goto WINUPDATE
if "%op%"=="5" goto DNS
if "%op%"=="6" goto RECYCLE
if "%op%"=="7" goto ALL
if "%op%"=="0" goto END

echo.
echo [!] Opção inválida.
pause
goto MENU

:TEMP_USER
echo.
echo Limpando TEMP do usuário...
del /s /q "%temp%\*" >nul 2>&1
for /d %%p in ("%temp%\*") do rmdir "%%p" /s /q >nul 2>&1
echo [OK] TEMP do usuário limpo.
pause
goto MENU

:TEMP_SYSTEM
echo.
echo Limpando TEMP do sistema...
del /s /q "C:\Windows\Temp\*" >nul 2>&1
for /d %%p in ("C:\Windows\Temp\*") do rmdir "%%p" /s /q >nul 2>&1
echo [OK] TEMP do sistema limpo.
pause
goto MENU

:PREFETCH
echo.
echo Limpando Prefetch...
del /s /q "C:\Windows\Prefetch\*" >nul 2>&1
echo [OK] Prefetch limpo.
pause
goto MENU

:WINUPDATE
echo.
echo Limpando cache do Windows Update...
net stop wuauserv >nul 2>&1
net stop bits >nul 2>&1

del /s /q "C:\Windows\SoftwareDistribution\Download\*" >nul 2>&1

net start wuauserv >nul 2>&1
net start bits >nul 2>&1
echo [OK] Cache do Windows Update limpo.
pause
goto MENU

:DNS
echo.
echo Limpando cache DNS...
ipconfig /flushdns >nul 2>&1
echo [OK] DNS limpo.
pause
goto MENU

:RECYCLE
echo.
echo Esvaziando lixeira...
PowerShell.exe -NoProfile -Command "Clear-RecycleBin -Force" >nul 2>&1
echo [OK] Lixeira esvaziada.
pause
goto MENU

:ALL
echo.
echo Limpando TUDO (pode demorar um pouco)...
echo.

REM TEMP USUARIO
del /s /q "%temp%\*" >nul 2>&1
for /d %%p in ("%temp%\*") do rmdir "%%p" /s /q >nul 2>&1

REM TEMP SISTEMA
del /s /q "C:\Windows\Temp\*" >nul 2>&1
for /d %%p in ("C:\Windows\Temp\*") do rmdir "%%p" /s /q >nul 2>&1

REM PREFETCH
del /s /q "C:\Windows\Prefetch\*" >nul 2>&1

REM WINDOWS UPDATE
net stop wuauserv >nul 2>&1
net stop bits >nul 2>&1
del /s /q "C:\Windows\SoftwareDistribution\Download\*" >nul 2>&1
net start wuauserv >nul 2>&1
net start bits >nul 2>&1

REM DNS
ipconfig /flushdns >nul 2>&1

REM LIXEIRA
PowerShell.exe -NoProfile -Command "Clear-RecycleBin -Force" >nul 2>&1

echo.
echo ============================================
echo [SUCESSO] Limpeza completa finalizada!
echo ============================================
pause
goto MENU

:END
exit
