@echo off

echo Finding Android version...

set %ver%=a

cd PT\system\

FIND /I /C "ro.build.version.sdk=22" "%~dp0PT\system\build.prop" >nul
IF %ERRORLEVEL% == 0 %~dp0lol.bat

FIND /I /C "ro.build.version.sdk=21" "%~dp0PT\system\build.prop" >nul
IF %ERRORLEVEL% == 0 %~dp0lol.bat

FIND /I /C "ro.build.version.sdk=23" "%~dp0PT\system\build.prop" >nul
IF %ERRORLEVEL% == 0 %~dp0mall.bat

FIND /I /C "ro.build.version.sdk=19" "%~dp0PT\system\build.prop" >nul
IF %ERRORLEVEL% == 0 %~dp0itk.bat
FIND /I /C "ro.build.version.sdk=20" "%~dp0PT\system\build.prop" >nul
IF %ERRORLEVEL% == 0 %~dp0itk.bat

echo cant find android version, set manually
echo K - kitkat
echo L - lollipop
echo M - Marshmallow
echo enter : 
set/p "ver=>"

:found
if %ver%==L start %~dp0lol.bat
if %ver%==M start %~dp0mall.bat
if %ver%==K start %~dp0itk.bat

echo Android version incompactable
goto end 

:end
timeout 2 >nul
pause
exit