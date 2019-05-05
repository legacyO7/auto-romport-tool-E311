
@echo off
echo cleaning...
rmdir /Q /S %~dp0panippura\2bg\system
rmdir /Q /S %~dp0panippura\2bg\META-INF
del BugfiX.zip
xcopy "%~dp0CIK\scripts\unzip.exe" "%~dp0panippura\2bg" /e /i /y
cd %~dp0panippura\2bg\
unzip 2bg.zip >nul
del unzip.exe


rmdir /Q /S %~dp0rom\PT
cd %~dp0rom
md PT
move /Y "%~dp0rom\port.zip" "%~dp0rom\PT\"
xcopy "%~dp0CIK\scripts\unzip.exe" "%~dp0rom\PT" /e /i /y
cd %~dp0rom\PT

cls
echo.
echo setting things up
echo please wait...
unzip port.zip >nul
del unzip.exe
move /Y "%~dp0rom\PT\port.zip" "%~dp0rom\"
cls
echo.
echo.
echo press y if you noticed the following bugs.
echo else, press any other key
pause
echo Bootloop?
set/p "ver=>"
if %ver%==y goto bootloop
echo No onscreen nav bar?
set/p "ver=>"
if %ver%==y ( cd %~dp0rom\PT\system\
echo qemu.hw.mainkeys=0 >> build.prop
copy /y %~dp0rom\PT\system\build.prop %~dp0panippura\2bg\system\
goto zipp
)
echo more bug fix will come in next update
pause
cls
%~dp0mct.bat

:bootloop
cd %~dp0
xcopy /y rom\PT\system\etc\firmware panippura\2bg\system\etc\firmware\ /E
xcopy /y rom\PT\system\etc\bluetooth panippura\2bg\system\etc\bluetooth\ /E
xcopy /y rom\PT\system\etc\permissions panippura\2bg\system\etc\permissions\ /E
xcopy /y rom\PT\system\etc\wifi panippura\2bg\system\etc\wifi\ /E

copy /y rom\PT\system\lib\libcrypto.so panippura\2bg\system\lib
copy /y rom\PT\system\lib\libjavacore.so panippura\2bg\system\lib
copy /y rom\PT\system\lib\libjavacrypto.so panippura\2bg\system\lib
copy /y rom\PT\system\lib\libreference-ril.so panippura\2bg\system\lib
copy /y rom\PT\system\lib\libsensorservice.so panippura\2bg\system\lib
copy /y rom\PT\system\lib\libshowlogo.so panippura\2bg\system\lib
copy /y rom\PT\system\lib\hw\camera.default.so panippura\2bg\system\lib\hw
copy /y rom\PT\system\lib\hw\camera.goldfish.jpeg.so panippura\2bg\system\lib\hw
copy /y rom\PT\system\lib\hw\camera.goldfish.so panippura\2bg\system\lib\hw
copy /y rom\PT\system\lib\hw\sensors.default.so panippura\2bg\system\lib\hw
copy /y rom\PT\system\lib\hw\sensors.goldfish.so panippura\2bg\system\lib\hw
copy /y rom\PT\system\lib\hw\sensors.ranchu.so panippura\2bg\system\lib\hw

:zipp
xcopy "%~dp0CIK\scripts\zip.exe" "%~dp0panippura\2bg" /e /i /y
cd %~dp0panippura\2bg
zip -r BugfiX.zip * >nul
copy /y %~dp0panippura\2bg\BugfiX.zip %~dp0 

cls
echo. 
echo Its time for round 3!
echo flash BugfiX.zip and try your luck
pause
%~dp0mct.bat

