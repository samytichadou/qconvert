::QCONVERT - SET FFMPEG MANUALLY

@echo off

::set ffmpeg path

echo.
set /p pa="FFMPEG "Bin" folder path (without the "\" after "bin") : "
setx ffmpeg "%pa%\ffmpeg.exe"
setx ffplay "%pa%\ffplay.exe"
setx ffprobe "%pa%\ffprobe.exe"
echo.
echo All set ! Let's QConvert !
PAUSE
END