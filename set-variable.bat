@echo off
title Criador de Variável de Ambiente - Jarvis
color 0A

REM ==============================
REM CONFIGURAÇÃO
REM ==============================
set VAR_NAME=GRAMADO_TOKEN
set VAR_VALUE=SEU_VALOR_AQUI

REM ==============================
REM CRIANDO VARIÁVEL DE AMBIENTE
REM ==============================
echo Criando variavel de ambiente...
setx %VAR_NAME% "%VAR_VALUE%" /M

if %errorlevel% neq 0 (
    echo [ERRO] Falha ao criar a variavel.
    echo Execute este arquivo como ADMINISTRADOR.
    pause
    exit /b
)

echo.
echo [SUCESSO] Variavel criada com sucesso!
echo Nome : %VAR_NAME%
echo Valor: %VAR_VALUE%
echo.
echo Reinicie o terminal ou o computador para aplicar.
pause
