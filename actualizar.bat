@echo off
REM ══════════════════════════════════════════════
REM DAG SF — Script de actualización (Windows)
REM Uso: actualizar.bat "descripción del cambio"
REM ══════════════════════════════════════════════

SET MENSAJE=%~1
IF "%MENSAJE%"=="" SET MENSAJE=actualizacion de presentacion

echo.
echo DAG SF — Deploy automatico
echo.

REM Copiar HTML si existe en Downloads
IF EXIST "%USERPROFILE%\Downloads\dag-sf-presentacion-v4.html" (
    echo Copiando HTML actualizado...
    copy "%USERPROFILE%\Downloads\dag-sf-presentacion-v4.html" "index.html" /Y
    echo OK - index.html actualizado
)

REM Git push
echo Subiendo a GitHub...
git add -A
git commit -m "deploy: %MENSAJE%"
git push origin main

echo.
echo Listo. Render redespliega en ~30 segundos.
echo https://github.com/Developmentart1/dag-sf-presentacion
echo.
