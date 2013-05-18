@REM  Robocopy Backup Script
@REM  AC89
@REM  Backup Script for Windows 7. 
@echo off
title Win 7 Backup Utility
color 0A
:MENU
echo **************************
echo ** Win 7 BACKUP UTILITY **
echo **************************
echo.
echo ! This tool has only been tested and known to work on Windows 7
echo ! By running this tool you, the user, accept all liability for 
echo ! lost, damaged, or misplaced data/hardware. If you do not agree with this
echo ! close the window now.
echo.
echo What type of backup would you like to run?
echo 1 - Local Backup (Default: G:\%username%_Backup)
echo 2 - Network Backup (Default: X:\%username%_Backup)
echo 3 - Custom Loacation (Default: "_":\%username%_Backup)
echo 4 - !Restore From Backup! (Default: "_:\%username%_Backup")
echo 5 - EXIT
echo ! Restore is experamental, Use at own risk. !
echo.
SET /P M=Backup Type:
if %M%==1 goto LOCAL
if %M%==2 goto NETWORK
if %M%==3 goto CUSTOM
if %M%==4 goto RESTORE
if %M%==5 goto EOF
:LOCAL
echo ******************
echo ** LOCAL BACKUP **
echo ******************
echo BACKUP IN PROGRESS, PLEASE WAIT.
echo !DO NOT TURN OFF OR UNPLUG THE COMPUTER!
robocopy "C:\Users\%username%\Desktop" "G:\%username%_Backup\Desktop" /FFT /XA:S /XJ /XO /mir
robocopy "C:\Users\%username%\Documents" "G:\%username%_Backup\Documents" /FFT /XA:S /XJ /XO /mir
robocopy "C:\Users\%username%\Downloads" "G:\%username%_Backup\Downloads" /FFT /XA:S /XJ /XO /mir
robocopy "C:\Users\%username%\Misc Sounds" "G:\%username%_Backup\Misc Sounds" /FFT /XA:S /XJ /XO /mir
robocopy "C:\Users\%username%\Music" "G:\%username%_Backup\Music" /FFT /XA:S /XJ /XO /mir
robocopy "C:\Users\%username%\Pictures" "G:\%username%_Backup\Pictures" /FFT /XA:S /XJ /XO /mir
robocopy "C:\Users\%username%\Videos" "G:\%username%_Backup\Videos" /FFT /XA:S /XJ /XO /mir
echo LOCAL BACKUP FINISHED.
pause
goto MENU
:NETWORK
echo ********************
echo ** NETWORK BACKUP **
echo ********************
echo CONNECTING...
net use X: (Network Location) /user:(Username) (Password)
echo CONNECTED! BACKUP IN PROGRESS, PLEASE WAIT.
echo !DO NOT TURN OFF OR UNPLUG THE COMPUTER AND NETWORK DRIVE!
robocopy "C:\Users\%username%\Desktop" "X:\%username%_Backup\Desktop" /FFT /XA:S /XJ /XO /mir
robocopy "C:\Users\%username%\Documents" "X:\%username%_Backup\Documents" /FFT /XA:S /XJ /XO /mir
robocopy "C:\Users\%username%\Downloads" "X:\%username%_Backup\Downloads" /FFT /XA:S /XJ /XO /mir
robocopy "C:\Users\%username%\Misc Sounds" "X:\%username%_Backup\Misc Sounds" /FFT /XA:S /XJ /XO /mir
robocopy "C:\Users\%username%\Music" "X:\%username%_Backup\Music" /FFT /XA:S /XJ /XO /mir
robocopy "C:\Users\%username%\Pictures" "X:\%username%_Backup\Pictures" /FFT /XA:S /XJ /XO /mir
robocopy "C:\Users\%username%\Videos" "X:\%username%_Backup\Videos" /FFT /XA:S /XJ /XO /mir
echo NETWORK BACKUP FINISHED.
pause
goto MENU
:CUSTOM
echo *******************
echo ** CUSTOM BACKUP **
echo *******************
echo SELECT THE DRIVE LETTER
echo !MAKE SURE THE DRIVE IS MOUNTED!
set /P VAR=Drive Letter: 
echo BACKUP IN PROGRESS, PLEASE WAIT.
echo !DO NOT TURN OFF OR UNPLUG THE COMPUTER!
robocopy "C:\Users\%username%\Desktop" "%VAR%:\%username%_Backup\Desktop" /FFT /XA:S /XJ /XO /mir
robocopy "C:\Users\%username%\Documents" "%VAR%:\%username%_Backup\Documents" /FFT /XA:S /XJ /XO /mir
robocopy "C:\Users\%username%\Downloads" "%VAR%:\%username%_Backup\Downloads" /FFT /XA:S /XJ /XO /mir
robocopy "C:\Users\%username%\Misc Sounds" "%VAR%:\%username%_Backup\Misc Sounds" /FFT /XA:S /XJ /XO /mir
robocopy "C:\Users\%username%\Music" "%VAR%:\%username%_Backup\Music" /FFT /XA:S /XJ /XO /mir
robocopy "C:\Users\%username%\Pictures" "%VAR%:\%username%_Backup\Pictures" /FFT /XA:S /XJ /XO /mir
robocopy "C:\Users\%username%\Videos" "%VAR%:\%username%_Backup\Videos" /FFT /XA:S /XJ /XO /mir
echo LOCAL BACKUP FINISHED.
pause
goto MENU
:RESTORE
color 0C
echo ********************
echo ** CUSTOM RESTORE **
echo ********************
echo SELECT THE DRIVE LETTER
echo !MAKE SURE THE DRIVE IS MOUNTED!
set /P VAR=Drive Letter: 
set /P NAME=Name of Backup: 
echo RESTORE IN PROGRESS, PLEASE WAIT.
echo !DO NOT TURN OFF OR UNPLUG THE COMPUTER AND OR NETWORK DRIVE!
robocopy "%VAR%:\%NAME%_Backup\Desktop" "C:\Users\%username%\Desktop" /FFT /XA:S /XJ /XO /mir
robocopy "%VAR%:\%NAME%_Backup\Documents" "C:\Users\%username%\Documents" /FFT /XA:S /XJ /XO /mir
robocopy "%VAR%:\%NAME%_Backup\Downloads" "C:\Users\%username%\Downloads" /FFT /XA:S /XJ /XO /mir
robocopy "%VAR%:\%NAME%_Backup\Misc Sounds" "C:\Users\%username%\Misc Sounds" /FFT /XA:S /XJ /XO /mir
robocopy "%VAR%:\%NAME%_Backup\Music" "C:\Users\%username%\Music" /FFT /XA:S /XJ /XO /mir
robocopy "%VAR%:\%NAME%_Backup\Pictures" "C:\Users\%username%\Pictures" /FFT /XA:S /XJ /XO /mir
robocopy "%VAR%:\%NAME%_Backup\Videos" "C:\Users\%username%\Videos" /FFT /XA:S /XJ /XO /mir
echo RESTORE FINISHED.
pause
goto MENU
:EOF
exit