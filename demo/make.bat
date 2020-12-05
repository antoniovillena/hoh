..\sjasmplus example.asm
..\ZMakeBas -r -o loader.bin loader.bas
..\GenTape example.tap            ^
    basic Prism   10  loader.bin  ^
    hdata Data  8000  example.bin

copy example.tap \Downloads\ZEsarUX-9.1-windows
cd \Downloads\ZEsarUX-9.1-windows
zesarux example.tap --verbose 3 --machine ZXUNO --quickexit
cd \repos\hoh\demo