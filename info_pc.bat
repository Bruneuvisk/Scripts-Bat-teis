@echo off
chcp 65001 >nul
title COLETOR DE INFORMAÇÕES DO PC - JARVIS
color 0A

:: Data e hora
set DATA=%date:/=-%
set HORA=%time::=-%
set HORA=%HORA: =%
set ARQ=relatorio_pc_%DATA%_%HORA%.txt

echo ========================================== > "%ARQ%"
echo     RELATÓRIO COMPLETO DO SISTEMA >> "%ARQ%"
echo     Gerado por: JARVIS >> "%ARQ%"
echo     Data: %date% %time% >> "%ARQ%"
echo ========================================== >> "%ARQ%"
echo. >> "%ARQ%"

echo [INFO] Coletando informações do sistema...
echo.

:: =========================
:: SISTEMA OPERACIONAL
:: =========================
echo ==== SISTEMA OPERACIONAL ==== >> "%ARQ%"
systeminfo >> "%ARQ%"
echo. >> "%ARQ%"

:: =========================
:: USUÁRIOS
:: =========================
echo ==== USUÁRIOS DO SISTEMA ==== >> "%ARQ%"
net user >> "%ARQ%"
echo. >> "%ARQ%"

:: =========================
:: CPU
:: =========================
echo ==== PROCESSADOR (CPU) ==== >> "%ARQ%"
wmic cpu get name,NumberOfCores,NumberOfLogicalProcessors,MaxClockSpeed >> "%ARQ%"
echo. >> "%ARQ%"

:: =========================
:: MEMÓRIA RAM
:: =========================
echo ==== MEMÓRIA RAM ==== >> "%ARQ%"
wmic OS get FreePhysicalMemory,TotalVisibleMemorySize >> "%ARQ%"
wmic memorychip get Capacity,Speed,Manufacturer >> "%ARQ%"
echo. >> "%ARQ%"

:: =========================
:: DISCO
:: =========================
echo ==== DISCOS E ARMAZENAMENTO ==== >> "%ARQ%"
wmic diskdrive get Model,Size,InterfaceType,MediaType >> "%ARQ%"
wmic logicaldisk get Name,FileSystem,FreeSpace,Size >> "%ARQ%"
echo. >> "%ARQ%"

:: =========================
:: PLACA DE VÍDEO
:: =========================
echo ==== PLACA DE VÍDEO (GPU) ==== >> "%ARQ%"
wmic path win32_VideoController get name,AdapterRAM,DriverVersion >> "%ARQ%"
echo. >> "%ARQ%"

:: =========================
:: REDE
:: =========================
echo ==== REDE ==== >> "%ARQ%"
ipconfig /all >> "%ARQ%"
echo. >> "%ARQ%"

:: =========================
:: PORTAS E CONEXÕES
:: =========================
echo ==== PORTAS E CONEXÕES ATIVAS ==== >> "%ARQ%"
netstat -ano >> "%ARQ%"
echo. >> "%ARQ%"

:: =========================
:: SERVIÇOS
:: =========================
echo ==== SERVIÇOS EM EXECUÇÃO ==== >> "%ARQ%"
sc query >> "%ARQ%"
echo. >> "%ARQ%"

:: =========================
:: PROGRAMAS INSTALADOS
:: =========================
echo ==== PROGRAMAS INSTALADOS ==== >> "%ARQ%"
wmic product get Name,Version >> "%ARQ%"
echo. >> "%ARQ%"

:: =========================
:: FIREWALL
:: =========================
echo ==== STATUS DO FIREWALL ==== >> "%ARQ%"
netsh advfirewall show allprofiles >> "%ARQ%"
echo. >> "%ARQ%"

:: =========================
:: FINAL
:: =========================
echo ========================================== >> "%ARQ%"
echo      FIM DO RELATÓRIO >> "%ARQ%"
echo ========================================== >> "%ARQ%"

echo.
echo ==========================================
echo   RELATÓRIO GERADO COM SUCESSO
echo   Arquivo: %ARQ%
echo ==========================================
pause
exit
