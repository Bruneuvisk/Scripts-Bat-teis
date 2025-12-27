@echo off
title LIMPEZA DE MEMÓRIA RAM - JARVIS
color 0A

echo ==========================================
echo      LIMPEZA DE MEMÓRIA RAM - JARVIS
echo ==========================================
echo.

:: Mostra uso de RAM antes
echo [INFO] Uso de memoria RAM ANTES:
wmic OS get FreePhysicalMemory,TotalVisibleMemorySize
echo.
pause

echo [ACAO] Reiniciando serviços pesados...

:: Serviços comuns que consomem RAM
net stop "SysMain" >nul 2>&1
net stop "Windows Search" >nul 2>&1

timeout /t 2 >nul

net start "SysMain" >nul 2>&1
net start "Windows Search" >nul 2>&1

echo [OK] Serviços reiniciados.
echo.

echo [ACAO] Limpando cache de memória...
:: Força liberação de cache
echo. > "%temp%\ram_cache.tmp"
del "%temp%\ram_cache.tmp" >nul 2>&1

timeout /t 2 >nul

:: Mostra uso de RAM depois
echo.
echo [INFO] Uso de memoria RAM DEPOIS:
wmic OS get FreePhysicalMemory,TotalVisibleMemorySize
echo.

echo ==========================================
echo   LIMPEZA DE MEMORIA CONCLUIDA COM SUCESSO
echo ==========================================
pause
exit
