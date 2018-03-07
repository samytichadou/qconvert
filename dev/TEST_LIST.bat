@echo off
setlocal ENABLEDELAYEDEXPANSION
set fName=%1
set ffmpeg="C:\Program Files\ffmpeg-3.3.1-win64-static\bin\ffmpeg.exe"

%fname% /b >> list.txt
PAUSE