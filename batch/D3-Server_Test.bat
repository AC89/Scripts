@echo off
TITLE Diablo 3 PathPing \ TraceRoute Utility
:START
Echo Diablo 3 PathPing and TraceRoute Utility
Echo Written by AC89
echo.
echo 1 - Test North American Server
echo 2 - Test Eruopian Server
echo 3 - Test Asian Server
echo 4 - Test All Servers
echo 5 - EXIT
echo.
choice /C 12345 /N /M "Select Test: "
if errorlevel 1 goto NATEST
if errorlevel 2 goto EUTEST
if errorlevel 3 goto ASTEST
if errorlevel 4 goto ALL
IF errorlevel 5 exit
:NATEST
Echo Starting PathPing
Echo Starting D3-NA PathPing... >> "%USERPROFILE%\Desktop\D3-NA_PingPath.txt"
echo %time% - %date% >> "%USERPROFILE%\Desktop\D3-NA_PingPath.txt"
pathping 12.129.209.68 >> "%USERPROFILE%\Desktop\D3-NA_PingPath.txt"
Echo Finished PathPing >> "%USERPROFILE%\Desktop\D3-NA_PingPath.txt"
echo Finished PathPing results are at %USERPROFILE%\Desktop\D3-NA_PingPath.txt
echo. >> "%USERPROFILE%\Desktop\D3-NA_PingPath.txt"
echo.
Echo Starting trace route
Echo Starting D3-NA trace route... >> "%USERPROFILE%\Desktop\D3-NA_Traceroute.txt"
echo %time% - %date% >> "%USERPROFILE%\Desktop\D3-NA_Traceroute.txt"
tracert 12.129.209.68 >> "%USERPROFILE%\Desktop\D3-NA_Traceroute.txt"
Echo Finished TraceRoute >> "%USERPROFILE%\Desktop\D3-NA_Traceroute.txt"
echo finished TraceRoute results are at %USERPROFILE%\Desktop\D3-NA_Traceroute.txt
echo. >> "%USERPROFILE%\Desktop\D3-NA_Traceroute.txt"
GOTO NAEOF
:EUTEST
Echo Starting PathPing
Echo Starting D3-NA PathPing... >> "%USERPROFILE%\Desktop\D3-EU_PingPath.txt"
echo %time% - %date% >> "%USERPROFILE%\Desktop\D3-EU_PingPath.txt"
pathping 213.155.155.233 >> "%USERPROFILE%\Desktop\D3-EU_PingPath.txt"
Echo Finished PathPing >> "%USERPROFILE%\Desktop\D3-EU_PingPath.txt"
echo Finished PathPing results are at %USERPROFILE%\Desktop\D3-EU_PingPath.txt
echo. >> "%USERPROFILE%\Desktop\D3-EU_PingPath.txt"
echo.
Echo Starting TraceRoute
Echo Starting D3-NA TraceRoute... >> "%USERPROFILE%\Desktop\D3-EU_Traceroute.txt"
echo %time% - %date% >> "%USERPROFILE%\Desktop\D3-EU_Traceroute.txt"
tracert 213.155.155.233 >> "%USERPROFILE%\Desktop\D3-EU_Traceroute.txt"
Echo Finished TraceRoute >> "%USERPROFILE%\Desktop\D3-EU_Traceroute.txt"
echo finished TraceRoute results are at %USERPROFILE%\Desktop\D3-EU_Traceroute.txt
echo. >> "%USERPROFILE%\Desktop\D3-EU_Traceoute.txt"
GOTO EUEOF
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
GOTO ASEOF
:NAEOF
Echo All Jobs Finished, retest in 1 hour.
Echo CTRL+C or close window to stop
timeout /t 10800
GOTO NATEST
:EUEOF
Echo All Jobs Finished, retest in 1 hour.
Echo CTRL+C or close window to stop
timeout /t 10800
GOTO EUTEST
:ASEOF
Echo All Jobs Finished, retest in 1 hour.
Echo CTRL+C or close window to stop
timeout /t 10800
GOTO ASTEST