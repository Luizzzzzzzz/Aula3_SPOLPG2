@echo off
setlocal

echo ==========================
echo      DEPLOYING
echo ==========================
echo.

cd /d "%~dp0"

echo Compilando projeto...
echo.

call mvn clean package

if errorlevel 1 (
    echo.
    echo ERRO na compilacao!
    pause
    exit /b 1
)

echo.
echo Procurando arquivo WAR...

set "WAR="

for %%F in (target\*.war) do set "WAR=%%F"

if not defined WAR (
    echo.
    echo ERRO: nenhum arquivo WAR foi encontrado!
    pause
    exit /b 1
)

echo WAR encontrado: %WAR%

echo.
echo Copiando WAR para o Tomcat...

copy /Y "%WAR%" "C:\Tomcat11\apache-tomcat-11.0.24\webapps\Exercicio.war"

if errorlevel 1 (
    echo.
    echo ERRO ao copiar o WAR!
    pause
    exit /b 1
)

echo.
echo Reiniciando Tomcat...

call "C:\Tomcat11\apache-tomcat-11.0.24\bin\shutdown.bat"

timeout /t 3 > nul

call "C:\Tomcat11\apache-tomcat-11.0.24\bin\startup.bat"

echo.
echo ==========================
echo    DEPLOY CONCLUIDO!
echo ==========================
echo.
echo Acesse:
echo http://localhost:8080/Exercicio/
echo.

pause