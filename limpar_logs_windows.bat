@echo off
title LIMPEZA DE LOGS DO WINDOWS - JARVIS
color 0C

echo ==========================================
echo      LIMPEZA DE LOGS DO WINDOWS - JARVIS
echo ==========================================
echo.
pause

echo [ACAO] Limpando Event Viewer (Logs do Sistema)...

for /f "tokens=*" %%G in ('wevtutil el') do (
    wevtutil cl "%%G" >nul 2>&1
)

echo [OK] Event Viewer limpo.
echo.

echo [ACAO] Limpando logs de erro e crash...

:: Logs gerais
del /f /s /q "%SystemRoot%\Logs\*" >nul 2>&1

:: Crash dumps
del /f /s /q "%SystemRoot%\Minidump\*" >nul 2>&1
del /f /s /q "%SystemRoot%\MEMORY.DMP" >nul 2>&1

:: Logs temporários
del /f /s /q "%temp%\*" >nul 2>&1

echo [OK] Logs de erro e crash removidos.
echo.

echo ==========================================
echo   LIMPEZA DE LOGS CONCLUIDA COM SUCESSO
echo ==========================================
pause
exit
