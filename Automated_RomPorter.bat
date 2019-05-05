@echo off
cls
echo .
echo========================Welcome======================
echo      This tool can be used to port roms for 
echo     MT6592 devices (MT6582 may be supported).
echo Under developing stage so must have many limitations
echo . 
echo .
echo ==============Terms and conditions===============
echo .
echo You are using this tool only on yourown
echo responsibility. I wont be responsible for
echo any damage that will be caused to your device
echo .... do you agree ? (a)
set/p "ver=>"
if not %ver%==a goto end
cls

echo.
echo Things you need before continuing....
echo 1. Your phone must be rooted and should have busybox installed 
echo 2. Notepad++ for windows
echo 3. Stock rom in .zip format
echo.
echo if you have all these, Lets continue (k)
set/p "ver=>"
if not %ver%==k goto end
cls
%~dp0mct.bat
