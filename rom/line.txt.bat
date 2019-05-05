echo Do you need onscreen - navigation bar? y/n 
set/p "ver=>"
if not %ver%==y goto skip
cd PT/system/
echo qemu.hw.mainkeys=0 >> build.prop
:skip
echo done!
