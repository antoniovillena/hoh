sjasmplus roms.asm
sjasmplus HOH.asm
for %%A in (hoh.bin) do set _fileSize=%%~zA
echo  define  length %_fileSize% >  define.asm
for %%A in (roms.bin) do set _fileSize=%%~zA
echo  define  romlength %_fileSize% >>  define.asm
sjasmplus loader.asm
GenTape hoh.tap             ^
  basic "HEAD" 0 loader.bin ^
   data roms.bin            ^
   data hoh.bin
copy hoh.tap \Downloads\ZEsarUX-9.1-windows
cd \Downloads\ZEsarUX-9.1-windows
zesarux hoh.tap --machine ZXUNO --quickexit
cd \repos\hoh