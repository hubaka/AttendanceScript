@echo off
echo 2 > C:\Users\akathire\Documents\pIm\work\Attendance\marco.txt
rem Following command starts the powershell to minimize all windows, which are open
rem This script connects to specific wifi network "7B7D55635"
powershell -command "& {&'C:\Users\akathire\Documents\pIm\work\Attendance\minimize.ps1'}"
rem Following command to open the wifi flyout
rundll32.exe %SystemRoot%\system32\van.dll,RunVAN
rem Following command to takes the screenshot of entire screen and stores it as image
powershell -command "& {&'C:\Users\akathire\Documents\pIm\work\Attendance\screenshot.ps1'}"
rem deletes logout screenshot script from task schedular
powershell -command "& {&'C:\Users\akathire\Documents\pIm\work\Attendance\anUserDeltask.ps1'}"

rem SetX /s CHE3-L02270 SECONDFLAG 0