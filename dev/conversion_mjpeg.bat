@echo off

:: ffmpeg relative path
set path_ffmpeg=%~dp0\ffmpeg-2021-11-22-git-203b0e3561-full_build\bin\ffmpeg.exe

:: get name
for %%f in ("%1") do set no_ext=%%~dpnf
set filepath=%no_ext%_mjpeg.mov

:: transcode
ECHO Transcoding %filepath%
"%path_ffmpeg%" -i "%1" -c:v mjpeg -q:v 10 "%filepath%"

:: tell user it's finished
ECHO
ECHO Transcode Finished
PAUSE
