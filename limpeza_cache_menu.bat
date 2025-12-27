@echo off
title Limpeza de Cache - Menu
color 0A

:MENU
cls
echo ======================================
echo        LIMPEZA DE CACHE - MENU
echo ======================================
echo.
echo 1 - Limpar TEMP do Usuario
echo 2 - Limpar TEMP do Sistema
echo 3 - Limpar Prefetch
echo 4 - Limpar Cache DNS
echo 5 - Esvaziar Lixeira
echo 6 - Limpeza Completa
echo 0 - Sair
echo.
set /p opcao=Escolha uma opcao: 

if "%opcao%"=="1" goto TEMP_USER
if "%opcao%"=="2" goto TEMP_SYSTEM
if "%opcao%"=="3" goto PREFETCH
if "%opcao%"=="4" goto DNS
if "%opcao%"=="5" goto RECYCLE
if "%opcao%"=="6" goto ALL
if "%opcao%"=="0" goto END

echo.
echo Opcao invalida!
pause
goto MENU

:TEMP_USER
cls
echo Limpando TEMP do usuario...
del /s /q "%TEMP%\*" >nul 2>&1
rd /s /q "%TEMP%" >nul 2>&1
mkdir "%TEMP%" >nul 2>&1
echo Concluido!
pause
goto MENU

:TEMP_SYSTEM
cls
echo Limpando TEMP do sistema...
del /s /q "C:\Windows\Temp\*" >nul 2>&1
echo Concluido!
pause
goto MENU

:PREFETCH
cls
echo Limpando Prefetch...
del /s /q "C:\Windows\Prefetch\*" >nul 2>&1
echo Concluido!
pause
goto MENU

:DNS
cls
echo Limpando cache DNS...
ipconfig /flushdns
pause
goto MENU

:RECYCLE
cls
echo Esvaziando Lixeira...
rd /s /q C:\$Recycle.Bin >nul 2>&1
echo Concluido!
pause
goto MENU

:ALL
call :TEMP_USER
call :TEMP_SYSTEM
call :PREFETCH
call :DNS
call :RECYCLE
goto MENU

:END
exit
