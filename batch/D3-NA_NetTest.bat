@echo off
TITLE Diablo 3 NA PingPath \ TraceRoute Utility
:NATEST
Echo Starting PathPing
Echo Starting D3-NA PathPing... >> "%USERPROFILE%\Desktop\D3-NA_PingPath.txt"
echo %time% - %date% >> "%USERPROFILE%\Desktop\D3-NA_PingPath.txt"
pathping 12.129.209.68 >> "%USERPROFILE%\Desktop\D3-NA_PingPath.txt"
Echo Finished PathPing. >> "%USERPROFILE%\Desktop\D3-NA_PingPath.txt"
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
:EOF
Echo All Jobs Finished, retest in 1 hour.
timeout /t 3600
goto NATEST
