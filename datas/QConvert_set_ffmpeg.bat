::QCONVERT - SET PARAMETERS

@echo off

setlocal ENABLEDELAYEDEXPANSION
set fName=%1
for /f "tokens=* delims= " %%F in ('echo %fName%') do (
setx ffmpeg "%%~fF"
echo FFMPEG new Path : 
echo %%~fF)
echo.
echo All set ! Let's QConvert !
PAUSE