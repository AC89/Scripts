@rem Authr: Alex Coke
@rem Date: Mar'13
@echo off
Title Nginx Control Script  
:start
cls
echo --Nginx Control Script--
echo "nginx -s [1. start | 2. stop |3. quit |4. reopen |5. reload]"
set /P opt="Option[1-5]: "
if "%opt%"=="1" start nginx.exe
if "%opt%"=="2" nginx -s stop
if "%opt%"=="3" nginx -s quit
if "%opt%"=="4" nginx -s reopen
if "%opt%"=="5" nginx -s reload
goto start
:WWWDB
C:\Nginx\mysql\bin mysqld.exe --console