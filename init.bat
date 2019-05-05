@echo off
cls
echo hello
echo Welcome to Rom Porting Software
echo                                -by Anit Sebastian
echo .
echo .
echo Shall we continue?
pause
rmdir /Q /S %~dp0rom\ST
rmdir /Q /S %~dp0rom\PT
cls
echo .
echo .
echo .
echo .
echo please add stock.zip and port.zip to rom folder and
pause
cd rom
setlocal
set file="stock.zip"
set maxbytesize=100000000

FOR /F "usebackq" %%A IN ('%file%') DO set size=%%~zA

if %size% LSS %maxbytesize% (
    echo File size is too low. Probably not a rom
	pause >nul
	goto zerr
) 
setlocal
set file="port.zip"
set maxbytesize=100000000

FOR /F "usebackq" %%A IN ('%file%') DO set size=%%~zA

if %size% LSS %maxbytesize% (
   echo File size is too low. Probably not a rom
	pause >nul
	goto zerr
) 
cls
cd %~dp0CIK
START /WAIT clean.bat
del "%~dp0CIK\boot-resources\boot.img" >nul
del "%~dp0CIK\boot-resources\stockboot.img" >nul
rmdir /Q /S "%~dp0CIK\boot"
rmdir /Q /S "%~dp0CIK\stockboot"
cd..
cd rom
IF NOT EXIST "stock.zip" goto zerr
IF NOT EXIST "port.zip" goto zerr
echo lets start
cd..
xcopy "%~dp0CIK\scripts\unzip.exe" "%~dp0rom" /e /i /y
xcopy "%~dp0CIK\scripts\zip.exe" "%~dp0rom" /e /i /y
cd rom
md ST
move /Y "stock.zip" "%~dp0rom/ST"
move /Y "unzip.exe" "%~dp0rom/ST"
xcopy "%~dp0CIK\scripts\unzip.exe" "%~dp0rom" /e /i /y
cd %~dp0rom/ST
echo                           ...PLease Wait...
unzip stock.zip >nul
color 0a
cls

ren boot.img stockboot.img
cd..
md PT
move /Y "port.zip" "%~dp0rom/PT"
move /Y "unzip.exe" "%~dp0rom/PT"
move /Y "zip.exe" "%~dp0rom/PT"
cd PT
echo                           ...PLease Wait...

unzip port.zip >nul
color 0c
cls

cd.. 
cd ST
del unzip.exe
move /Y "%~dp0rom\ST\stockboot.img" "%~dp0CIK\boot-resources" 

cls
echo .
echo .
echo would you like to change the mount points ?
echo if you select 'y' open with notepad++ when prompted,
echo make changes if necessary and save it manually. (y/n) 
set/p "ver=>"
cd %~dp0
if %ver%==y ( start /wait rom\PT\META-INF\com\google\android\updater-script
pause
)

cd %~dp0CIK/
START /WAIT cup.bat

del "%~dp0CIK/boot-resources/stockboot.img" 
move /Y "%~dp0rom\PT\boot.img" "%~dp0CIK\boot-resources" 
cd %~dp0CIK/
START /WAIT cup.bat
if not exist stockboot/boot.img-kernel goto kerr
if not exist boot/boot.img-kernel goto kerr

copy "%~dp0CIK\stockboot\boot.img-base" "%~dp0CIK\boot" >nul
copy "%~dp0CIK\stockboot\boot.img-kernel" "%~dp0CIK\boot" >nul
copy "%~dp0CIK\stockboot\boot.img-ramdisk_offset" "%~dp0CIK\boot" >nul
copy "%~dp0CIK\stockboot\boot.img-ramdisk-compress" "%~dp0CIK\boot" >nul
copy "%~dp0CIK\stockboot\boot.img-kernel_offset" "%~dp0CIK\boot" >nul
copy "%~dp0CIK\stockboot\boot.img-mtk" "%~dp0CIK\boot" >nul
copy "%~dp0CIK\stockboot\boot.img-pagesize" "%~dp0CIK\boot" >nul
copy "%~dp0CIK\stockboot\boot.img-tags_offset" "%~dp0CIK\boot" >nul

del "%~dp0CIK\boot-resources\stockboot.img" >nul

start /wait crp.bat
move /Y "%~dp0CIK\output\boot.img" "%~dp0rom\PT" 
move /Y "%~dp0rom\ST\stock.zip" "%~dp0rom"
move /Y "%~dp0rom\PT\port.zip" "%~dp0rom"
cd "%~dp0rom"

cls
echo .
echo .
echo .
echo Waiting for result ...
cls
start /wait prime.bat
cls
copy "%~dp0rom\PT\Ported_Rom.zip" "%~dp0" >nul

echo.
echo Ported_Rom.zip is at the root directory, 
timeout 2 >nul
echo .
echo Copy it to sdcard and flash it.
timeout 2 >nul
echo.
echo This isnt over. There must be some bugs waiting for you
timeout 2 >nul
echo.
echo Take a piece of paper and write down the bugs u noted
timeout 2 >nul
echo And lets go for Round 2 !!!
timeout 3 >nul
echo.
echo Iam waiting.... whenever you are ready
pause
%~dp02bG.bat

goto end
:kerr
echo kernel error
goto end
:zerr
cls
echo stock.zip or port.zip is missing
:end
echo ROM PORTING SOFTWARE
timeout 2 >nul
pause
exit