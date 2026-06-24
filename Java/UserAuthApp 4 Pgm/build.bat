@echo off
setlocal
set "APP_DIR=%~dp0"
if "%TOMCAT_HOME%"=="" (
    set "TOMCAT_HOME=C:\Apache\apache-tomcat-11.0.21"
)
echo Using TOMCAT_HOME=%TOMCAT_HOME%
if not exist "%TOMCAT_HOME%\lib\servlet-api.jar" (
    echo ERROR: TOMCAT_HOME is not set correctly or servlet-api.jar is missing.
    echo Please set TOMCAT_HOME to your Tomcat installation path.
    goto :eof
)

echo Using app root files directly. WebContent directory is no longer required.

if not exist "%APP_DIR%WEB-INF\classes" (
    mkdir "%APP_DIR%WEB-INF\classes"
)

echo Compiling Java sources...
javac -d "%APP_DIR%WEB-INF\classes" -cp "%APP_DIR%WEB-INF\lib\mysql-connector-j-9.6.0.jar;%TOMCAT_HOME%\lib\servlet-api.jar" "%APP_DIR%src\com\auth\*.java"
if errorlevel 1 (
    echo Compilation failed.
    goto :eof
)

echo Build completed successfully.
endlocal
