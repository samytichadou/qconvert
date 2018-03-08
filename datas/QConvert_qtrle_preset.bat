::QTRLE PRESET

@echo off
setlocal ENABLEDELAYEDEXPANSION
set fName=%1

ffmpeg -i input.mp4 -codec copy -c:v qtrle output.mov