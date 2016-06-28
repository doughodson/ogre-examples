rem
rem delete old solution/workspace files
rem
rmdir /S /Q ..\vs2013
rmdir /S /Q ..\vs2015
rem
rem delete old compiled libraries
rem
rmdir /S /Q ..\..\lib\vs2013
rmdir /S /Q ..\..\lib\vs2015
rem
rem create new solution/workspace files
rem
premake5-alpha9.exe vs2013
rem premake5-alpha9.exe vs2015

