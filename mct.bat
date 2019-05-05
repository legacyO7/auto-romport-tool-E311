:mm
cls
echo .
echo -----------------Main Menu------------------
echo .
echo 1. Port the rom
echo 2. Bug Fixing 
echo 3. Update
echo 4. About
echo 5. Exit
echo .
echo --------------------------------------------
set/p "ver=>"
if %ver%==1 ( %~dp0init.bat
goto mm
)
if %ver%==2 ( %~dp02bG.bat
goto mm
)
if %ver%==3 ( start %~dp0Upd.bat
exit
)
if %ver%==4 ( %~dp0abt.bat
goto mm
)
if %ver%==5 goto end

 :end
 cls
 echo .
 echo Automated Rom Porter 
 echo                     by Anit Sebastian
 echo =======from the maker of VRT===========
pause >nul
exit