@echo off
setlocal
set "APP_DIR=%~dp0"
if "%TOMCAT_HOME%"=="" (
    set "TOMCAT_HOME=C:\Apache\apache-tomcat-11.0.21"
)

echo Using TOMCAT_HOME=%TOMCAT_HOME%
if not exist "%TOMCAT_HOME%\bin\shutdown.bat" (
    echo ERROR: TOMCAT_HOME is not set correctly or Tomcat bin directory is missing.
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

echo Stopping Tomcat...
set "CATALINA_HOME=%TOMCAT_HOME%"
set "CATALINA_BASE=%TOMCAT_HOME%"
call "%TOMCAT_HOME%\bin\shutdown.bat"

echo Clearing work directory...
if exist "%TOMCAT_HOME%\work\Catalina\localhost\UserAuthApp" (
    rd /s /q "%TOMCAT_HOME%\work\Catalina\localhost\UserAuthApp"
)

echo Starting Tomcat...
set "CATALINA_HOME=%TOMCAT_HOME%"
set "CATALINA_BASE=%TOMCAT_HOME%"
call "%TOMCAT_HOME%\bin\startup.bat"

echo Redeploy complete. Open http://localhost:8080/UserAuthApp/
endlocal
