@echo off
echo.
echo.
echo.
echo ................Update Terminal................
echo.
echo.
echo.
echo Place the xxxxxx.ANIT.update to update folder and
pause
cd %~dp0update
if not exist *.ANIT.update goto end


xcopy "%~dp0CIK\scripts\unzip.exe" "%~dp0update" /e /i /y
cd %~dp0update
ren *.ANIT.update anit.zip
unzip anit.zip >nul
cd %~dp0update\ats
xcopy /y "%~dp0update\ats" "%~dp0" /E /i
rmdir /Q /S %~dp0update\
cls
echo.
echo.
echo Software update completed...
pause >nul
%~dp0mct.bat
