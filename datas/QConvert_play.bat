::ffplay

@echo off
setlocal ENABLEDELAYEDEXPANSION
set fName=%1

for /f "tokens=* delims= " %%F in ('echo %fName%') do (
"%ffplay%" "%%~fF" -x 960 -y 540 -loop 0)

END