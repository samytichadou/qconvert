::ffprobe infos

@echo off
setlocal ENABLEDELAYEDEXPANSION
set fName=%1

for /f "tokens=* delims= " %%F in ('echo %fName%') do (
"%ffprobe%" -v quiet -print_format json -show_format -show_streams "%%~fF" > "%%~dpnF_infos.txt")

END