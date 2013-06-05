@echo off
TITLE Diablo 3 PingPath \ TraceRoute Utility
:START
echo 1 - Test North American Server
echo 2 - Test Eruopian Server
echo 3 - Test Asian Server
echo 4 - Test All Servers
echo 5 - EXIT
echo.
SET /P M=Select Test: 
if %M%==1 goto NATEST
if %M%==2 goto EUTEST
if %M%==3 goto ASTEST
if %M%==4 goto ALL
IF %M%==5 exit
:NATEST
Echo Starting PathPing
Echo Starting D3-NA PathPing... >> "%USERPROFILE%\Desktop\D3-NA_PingPath.txt"
echo %time% - %date% >> "%USERPROFILE%\Desktop\D3-NA_PingPath.txt"
pathping 12.129.209.68 >> "%USERPROFILE%\Desktop\D3-NA_PingPath.txt"
Echo Finished PathPing >> "%USERPROFILE%\Desktop\D3-NA_PingPath.txt"
echo Finished PathPing results are at %USERPROFILE%\Desktop\D3-NA_PingPath.txt
echo. >> "%USERPROFILE%\Desktop\D3-NA_PingPath.txt"
echo.
Echo Starting Traceroute
Echo Starting D3-NA TraceRoute... >> "%USERPROFILE%\Desktop\D3-NA_Traceroute.txt"
echo %time% - %date% >> "%USERPROFILE%\Desktop\D3-NA_Traceroute.txt"
tracert 12.129.209.68 >> "%USERPROFILE%\Desktop\D3-NA_Traceroute.txt"
Echo Finished TraceRoute >> "%USERPROFILE%\Desktop\D3-NA_Traceroute.txt"
echo finished TraceRoute results are at %USERPROFILE%\Desktop\D3-NA_Traceroute.txt
echo. >> "%USERPROFILE%\Desktop\D3-NA_Traceroute.txt"
GOTO EOF
:EUTEST
Echo Starting PathPing
Echo Starting D3-NA PathPing... >> "%USERPROFILE%\Desktop\D3-EU_PingPath.txt"
echo %time% - %date% >> "%USERPROFILE%\Desktop\D3-EU_PingPath.txt"
pathping 213.155.155.233 >> "%USERPROFILE%\Desktop\D3-EU_PingPath.txt"
Echo Finished PathPing >> "%USERPROFILE%\Desktop\D3-EU_PingPath.txt"
echo Finished PathPing results are at %USERPROFILE%\Desktop\D3-EU_PingPath.txt
echo. >> "%USERPROFILE%\Desktop\D3-EU_PingPath.txt"
echo.
Echo Starting Traceroute
Echo Starting D3-NA TraceRoute... >> "%USERPROFILE%\Desktop\D3-EU_Traceroute.txt"
echo %time% - %date% >> "%USERPROFILE%\Desktop\D3-EU_Traceroute.txt"
tracert 213.155.155.233 >> "%USERPROFILE%\Desktop\D3-EU_Traceroute.txt"
Echo Finished TraceRoute >> "%USERPROFILE%\Desktop\D3-EU_Traceroute.txt"
echo finished TraceRoute results are at %USERPROFILE%\Desktop\D3-EU_Traceroute.txt
echo. >> "%USERPROFILE%\Desktop\D3-EU_Traceroute.txt"
GOTO EOF
:ASTEST
Echo Starting PathPing
Echo Starting D3-NA PathPing... >> "%USERPROFILE%\Desktop\D3-AS_PingPath.txt"
echo %time% - %date% >> "%USERPROFILE%\Desktop\D3-AS_PingPath.txt"
pathping 182.162.134.1 >> "%USERPROFILE%\Desktop\D3-AS_PingPath.txt"
Echo Finished PathPing >> "%USERPROFILE%\Desktop\D3-AS_PingPath.txt"
echo Finished PathPing results are at %USERPROFILE%\Desktop\D3-AS_PingPath.txt
echo. >> "%USERPROFILE%\Desktop\D3-AS_PingPath.txt"
echo.
Echo Starting Traceroute
Echo Starting D3-NA TraceRoute... >> "%USERPROFILE%\Desktop\D3-AS_Traceroute.txt"
echo %time% - %date% >> "%USERPROFILE%\Desktop\D3-AS_Traceroute.txt"
tracert 182.162.134.1 >> "%USERPROFILE%\Desktop\D3-AS_Traceroute.txt"
Echo Finished TraceRoute >> "%USERPROFILE%\Desktop\D3-AS_Traceroute.txt"
echo finished TraceRoute results are at %USERPROFILE%\Desktop\D3-AS_Traceroute.txt
echo. >> "%USERPROFILE%\Desktop\D3-AS_Traceroute.txt"
GOTO EOF
:EOF
Echo All Jobs Finished, retest in 1 hour.
timeout /t 3600
goto START
