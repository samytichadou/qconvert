::@echo off

:: ffmpeg relative path
set path_ffmpeg=%~dp0\ffmpeg-2021-11-22-git-203b0e3561-full_build\bin\ffmpeg.exe

:: ask user for confirmation
ECHO
ECHO Convert files in %1 ?
ECHO
PAUSE

::for %%i in (%1*.mov) do "C:\Users\s.tichadou\Documents\ffmpeg-2021-11-22-git-203b0e3561-full_build\bin\ffmpeg.exe" -i "%%i" -c:v mjpeg -q:v 10 "transcode_%%i"
for %%i in (%1) do ECHO "transcode_%%i"

:: tell user it's finished
ECHO
ECHO Transcode Finished
PAUSE