::H264 PRESET

@echo off
setlocal ENABLEDELAYEDEXPANSION
set fName=%1

::EXTENSION

ECHO --- H264 SETTINGS ---
ECHO.
ECHO Video Container : 
ECHO 1. mov
ECHO 2. mp4
ECHO 3. avi
ECHO 4. mkv
ECHO.

CHOICE /C 1234 /M "Choose an Extension"

IF ERRORLEVEL 4 set extension=mkv
IF ERRORLEVEL 3 set extension=avi
IF ERRORLEVEL 2 set extension=mp4
IF ERRORLEVEL 1 set extension=mov

::PROFILE

CLS
ECHO --- H264 SETTINGS ---
ECHO.
ECHO H264 Profile : 
ECHO 1. Baseline
ECHO 2. Main
ECHO 3. High
ECHO 4. High 10
ECHO 5. High 422
ECHO 6. High 444
ECHO.

CHOICE /C 123456 /M "Choose a Profile"

IF ERRORLEVEL 6 set profile=high444
IF ERRORLEVEL 5 set profile=high422
IF ERRORLEVEL 4 set profile=high10
IF ERRORLEVEL 3 set profile=high
IF ERRORLEVEL 2 set profile=main
IF ERRORLEVEL 1 set profile=baseline

::BITRATE

CLS
ECHO --- H264 SETTINGS ---
ECHO.
set /p tr="Target Rate in Mb/s : "
set targetrate=%tr%
ECHO.
set /p mir="Minimum Rate in Mb/s : "
set minrate=%mir%
ECHO.
set /p mar="Maximum Rate in Mb/s : "
set maxrate=%mar%
ECHO.
set /p mr="Buffer Size in Mb : "
set buffersize=%tr%

::ENCODING

if %profile% ==high444 (goto :444) else (
	 if %profile% ==high422 (goto :422) else (goto :420))

:444
for /f "tokens=* delims= " %%F in ('echo %fName%') do (
"%ffmpeg%" -i "%%~fF" -c:v libx264 -profile:v %profile% -b:v %targetrate%M -minrate %minrate%M -maxrate %maxrate%M -bufsize %buffersize%M "%%~dpnF_h264.%extension%"
goto :end
)

:422
for /f "tokens=* delims= " %%F in ('echo %fName%') do (
"%ffmpeg%" -i "%%~fF" -c:v libx264 -profile:v %profile% -pix_fmt yuv422p -b:v %targetrate%M -minrate %minrate%M -maxrate %maxrate%M -bufsize %buffersize%M "%%~dpnF_h264.%extension%"
goto :end
)

:420
for /f "tokens=* delims= " %%F in ('echo %fName%') do (
"%ffmpeg%" -i "%%~fF" -c:v libx264 -profile:v %profile% -pix_fmt yuv420p -b:v %targetrate%M -minrate %minrate%M -maxrate %maxrate%M -bufsize %buffersize%M "%%~dpnF_h264.%extension%"
goto :end
)

:end
END