@rem  Test Backup Script
@REM Sanatized file. look for (IPADDR), (USER), and (PASSWD)
@REM Replace items in the () and also in the destination and source
@REM as well as the logging options to suit your need.
@ECHO OFF
TITLE "%computername% Backup Utility"
COLOR 17
SETLOCAL
:KILL
taskkill /F /T /IM robocopy.exe
@rem inusres robocopy.exe is killed before the script
goto SETA
@rem :MOUNT
@REM net use z: \\(IP_ADDR)\backup /user:(USER) (PASSWD)
@REM Mount back up drive
@rem GOTO SETA
:SETA
set _HH=%time:~0,2%
set _HH=%_HH%
set _MM=%time:~3,2%
set _MM=%_MM%
set _SS=%time:~6,2%
set _SS=%_SS%
@rem Seperates hours minutes and seconds into variable.
if %_HH% GEQ 12 set _AP=pm
if %_HH% LEQ 11 set _AP=am
@rem am/pm variable setup.
if %_HH% GEQ 13 set /a _HH-=12
@rem Converts 24hr to 12hr time format
set _time=%_HH%.%_MM%.%_SS%%_AP%
@rem Combines into one variable for ease of use.
set LogExt=.log
set LogName=SETA%LogExt%
set _log=%date:~4%
set _log=%_log:/=-%
set _log=%_log% %_time% %LogName%
@rem setup for _log file name to include a date and name.
@rem use set _log=%date:~4% instead to remove the day of the week
@rem Note that the quotes are REQUIRED around %_log% in case it contains a space
SET _source="D:\SETA"
SET _dest="\\(IPADDR)\backup\%computername%\SETA"
SET _what=/E /XJ /XO /COPY:DT /XD "IT"
@REM /COPY:DT D=Data T=Timestamps
@REM  /E - Copy Subfolders, including Empty Subfolders.
@REM  /XJ - eXclude Junction points. (normally included by default).
@REM  /XO - eXclude Older - if destination file exists and is the same date or newer than the source - don't bother to overwrite it. 
SET _options=/FFT /ZB /log+:"\\(IPADDR)\%computername%\%_log%" /TEE /ETA /NP /R:3 /W:15
@REM  /FFT - Assume FAT File Times (2-second date/time granularity).
@REM  /ZB - Use restartable mode; if access denied use Backup mode.
@REM  /LOG+:file - Output status to LOG file (append to existing log).
@REM  /TEE - Output to console window, as well as the log file.
@REM  /ETA - Show Estimated Time of Arrival of copied files.
@REM  /NP - No Progress - don't display % copied.
@REM  /R:n - Number of Retries on failed copies - default is 1 million.  
@REM  /W:n : Wait time between retries - default is 30 seconds.
ROBOCOPY %_source% %_dest% %_what% %_options% 
GOTO SETB
:SETB
set _HH=%time:~0,2%
set _HH=%_HH%
set _MM=%time:~3,2%
set _MM=%_MM%
set _SS=%time:~6,2%
set _SS=%_SS%
@rem Seperates hours minutes and seconds into variable.
if %_HH% GEQ 12 set _AP=pm
if %_HH% LEQ 11 set _AP=am
@rem am/pm variable setup.
if %_HH% GEQ 13 set /a _HH-=12
@rem Converts 24hr to 12hr time format
set _time=%_HH%.%_MM%.%_SS%%_AP%
@rem Combines into one variable for ease of use.
set LogExt=.log
set LogName=SETB%LogExt%
set _log=%date:~4%
set _log=%_log:/=-%
set _log=%_log% %_time% %LogName%
@rem setup for _log file name to include a date and name.
@rem use set _log=%date:~4% instead to remove the day of the week
@rem Note that the quotes are REQUIRED around %_log% in case it contains a space
SET _source="D:\SETB"
SET _dest="\\(IPADDR)\backup\%computername%\SETB"
SET _what=/E /XJ /XO /COPY:DT
@REM /COPY:DT D=Data T=Timestamps
@REM  /E - Copy Subfolders, including Empty Subfolders.
@REM  /XJ - eXclude Junction points. (normally included by default).
@REM  /XO - eXclude Older - if destination file exists and is the same date or newer than the source - don't bother to overwrite it. 
SET _options=/FFT /ZB /log+:"\\(IPADDR)\%computername%\%_log%" /TEE /ETA /NP /R:3 /W:15
@REM  /FFT - Assume FAT File Times (2-second date/time granularity).
@REM  /ZB - Use restartable mode; if access denied use Backup mode.
@REM  /LOG+:file - Output status to LOG file (append to existing log).
@REM  /TEE - Output to console window, as well as the log file.
@REM  /ETA - Show Estimated Time of Arrival of copied files.
@REM  /NP - No Progress - don't display % copied.
@REM  /R:n - Number of Retries on failed copies - default is 1 million. 
@REM  /W:n : Wait time between retries - default is 30 seconds.
ROBOCOPY %_source% %_dest% %_what% %_options% 
GOTO DISMOUNT
:DISMOUNT
@rem net use z: /delete
@REM Dismount back up drive
GOTO MAIL
:MAIL
C:\Windows\System32\CScript.exe "%logonserver%\NETLOGON\backup\email.vbs"
@REM Calls outside script to send completion notice.
goto KILLTWO
:KILLTWO
taskkill /F /T /IM robocopy.exe
@rem inusres robocopy.exe is killed before the script
