This works for 64 bit windows/matlab users only, .dylib files are the dynamic library equivalent for macs and .so for linux
also I don't even have a mac so no icode or whatever 
If you have a mac/ linux, you might want to look into Java programming but asynchronous java input is not easy which is why it's done in C

You will need the Visual Studio 2015 Redistributable located here, unless you have Visual Studio Community 2015 installed: 
https://www.microsoft.com/en-us/download/details.aspx?id=48145

If you're dubious about the code in the .dll, it's included in "source.c"/"Header.h"
Place "mproto.m", "MatlabAsyncKeys.dll", and "MatlabAsyncKeys_thunk_pcwin64.dll" in the same directory as your matlab code
Before you run "source.m" in matlab, load the library via:
loadlibrary('MatlabAsyncKeys', @mproto)
it shouldn't return anything and it be check if it was properly loaded via:
libisloaded('MatlabAsyncKeys')
and it should return 1
