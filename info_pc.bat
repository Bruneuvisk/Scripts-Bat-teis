@echo off
chcp 65001 >nul
title COLETOR DE INFORMACOES DO PC - JARVIS
color 0A

:: Pasta de saída
set OUTDIR=C:\Relatorios
if not exist "%OUTDIR%" mkdir "%OUTDIR%"

:: Data e hora seguras
for /f "tokens=1-3 delims=/" %%a in ("%date%") do set DATA=%%c-%%b-%%a
for /f "tokens=1-3 delims=:." %%a in ("%time%") do set HORA=%%a-%%b-%%c

set ARQ=%OUTDIR%\relatorio_pc_%DATA%_%HORA%.txt

echo ========================================== > "%ARQ%"
echo     RELATORIO COMPLETO DO SISTEMA >> "%ARQ%"
echo     Gerado por: JARVIS >> "%ARQ%"
echo     Data: %date% %time% >> "%ARQ%"
echo ========================================== >> "%ARQ%"
echo. >> "%ARQ%"

echo [INFO] Coletando dados...

:: ===============================
:: SISTEMA
:: ===============================
echo ==== SISTEMA OPERACIONAL ==== >> "%ARQ%"
systeminfo >> "%ARQ%"
echo. >> "%ARQ%"

:: ===============================
:: CPU
:: ===============================
echo ==== PROCESSADOR (CPU) ==== >> "%ARQ%"
powershell -command "Get-CimInstance Win32_Processor | Select Name,NumberOfCores,NumberOfLogicalProcessors,MaxClockSpeed" >> "%ARQ%"
echo. >> "%ARQ%"

:: ===============================
:: MEMORIA RAM
:: ===============================
echo ==== MEMORIA RAM ==== >> "%ARQ%"
powershell -command "Get-CimInstance Win32_OperatingSystem | Select TotalVisibleMemorySize,FreePhysicalMemory" >> "%ARQ%"
powershell -command "Get-CimInstance Win32_PhysicalMemory | Select Capacity,Speed,Manufacturer" >> "%ARQ%"
echo. >> "%ARQ%"

:: ===============================
:: DISCO
:: ===============================
echo ==== DISCOS ==== >> "%ARQ%"
powershell -command "Get-CimInstance Win32_DiskDrive | Select Model,Size,InterfaceType,MediaType" >> "%ARQ%"
powershell -command "Get-CimInstance Win32_LogicalDisk | Select DeviceID,FileSystem,FreeSpace,Size" >> "%ARQ%"
echo. >> "%ARQ%"

:: ===============================
:: GPU
:: ===============================
echo ==== PLACA DE VIDEO ==== >> "%ARQ%"
powershell -command "Get-CimInstance Win32_VideoController | Select Name,AdapterRAM,DriverVersion" >> "%ARQ%"
echo. >> "%ARQ%"

:: ===============================
:: REDE
:: ===============================
echo ==== REDE ==== >> "%ARQ%"
ipconfig /all >> "%ARQ%"
echo. >> "%ARQ%"

:: ===============================
:: PORTAS
:: ===============================
echo ==== PORTAS ABERTAS ==== >> "%ARQ%"
netstat -ano >> "%ARQ%"
echo. >> "%ARQ%"

:: ===============================
:: SERVICOS
:: ===============================
echo ==== SERVICOS ATIVOS ==== >> "%ARQ%"
sc query >> "%ARQ%"
echo. >> "%ARQ%"

:: ===============================
:: FIREWALL
:: ===============================
echo ==== FIREWALL ==== >> "%ARQ%"
netsh advfirewall show allprofiles >> "%ARQ%"
echo. >> "%ARQ%"

echo ========================================== >> "%ARQ%"
echo      FIM DO RELATORIO >> "%ARQ%"
echo ========================================== >> "%ARQ%"

echo.
echo ==========================================
echo  RELATORIO GERADO COM SUCESSO
echo  %ARQ%
echo ==========================================
pause
exit
