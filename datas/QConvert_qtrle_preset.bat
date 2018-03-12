::QTRLE PRESET

@echo off
setlocal ENABLEDELAYEDEXPANSION
set fName=%1

for /f "tokens=* delims= " %%F in ('echo %fName%') do (
"%ffmpeg%" -i "%%~fF" -codec copy -c:v qtrle "%%~dpnF_qtrle.mov"
)

END