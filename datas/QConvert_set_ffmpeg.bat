::QCONVERT - SET PARAMETERS

@echo off

setlocal ENABLEDELAYEDEXPANSION
set fName=%1
for /f "tokens=* delims= " %%F in ('echo %fName%') do (
setx ffmpeg "%%~fF\ffmpeg.exe"
setx ffplay "%%~fF\ffplay.exe"
setx ffprobe "%%~fF\ffprobe.exe")
echo.
echo All set ! Let's QConvert !
PAUSE
END