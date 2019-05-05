@echo off
cls
echo MarshMallow rom Detected!!!
echo Executing scripts of MM ...
timeout 2 >nul

cd %~dp0

xcopy /y ST\system\etc\firmware PT\system\etc\firmware\ /E
xcopy /y ST\system\etc\bluetooth PT\system\etc\bluetooth\ /E
xcopy /y ST\system\etc\permissions PT\system\etc\permissions\ /E
xcopy /y ST\system\etc\wifi PT\system\etc\wifi\ /E

copy /y ST\system\lib\libaudio.primary.default.so PT\system\lib
copy /y ST\system\lib\libcam.exif.so PT\system\lib
copy /y ST\system\lib\libcam.paramsmgr.so PT\system\lib
copy /y ST\system\lib\libcamalgo.so PT\system\lib
copy /y ST\system\lib\libcamdrv.so PT\system\lib
copy /y ST\system\lib\libcameracustom.so PT\system\lib
copy /y ST\system\lib\libcrypto.so PT\system\lib
copy /y ST\system\lib\libdpframework.so PT\system\lib
copy /y ST\system\lib\libfeatureio.so PT\system\lib
copy /y ST\system\lib\libjavacore.so PT\system\lib
copy /y ST\system\lib\libjavacrypto.so PT\system\lib
copy /y ST\system\lib\libMali.so PT\system\lib
copy /y ST\system\lib\libreference-ril.so PT\system\lib
copy /y ST\system\lib\libsensorservice.so PT\system\lib
copy /y ST\system\lib\libshowlogo.so PT\system\lib
copy /y ST\system\lib\hw\camera.default.so PT\system\lib\hw
copy /y ST\system\lib\hw\camera.goldfish.jpeg.so PT\system\lib\hw
copy /y ST\system\lib\hw\camera.goldfish.so PT\system\lib\hw
copy /y ST\system\lib\hw\sensors.default.so PT\system\lib\hw
copy /y ST\system\lib\hw\sensors.goldfish.so PT\system\lib\hw
copy /y ST\system\lib\hw\sensors.ranchu.so PT\system\lib\hw

finalT.bat