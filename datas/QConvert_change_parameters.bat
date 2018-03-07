::QCONVERT - SET PARAMETERS

@echo off
::set environnement variable

CLS
ECHO --- QCONVERT SETTINGS ---
ECHO.
set /p tr="Target Rate in Mb/s : "
setx ffmpeg_targetrate "%tr%"
CLS
ECHO --- QCONVERT SETTINGS ---
ECHO.
set /p mir="Minimum Rate in Mb/s : "
setx ffmpeg_minrate "%mir%"
CLS
ECHO --- QCONVERT SETTINGS ---
ECHO.
set /p mar="Maximum Rate in Mb/s : "
setx ffmpeg_maxrate "%mar%"
CLS
ECHO --- QCONVERT SETTINGS ---
ECHO.
set /p mr="Buffer Size in Mb : "
setx ffmpeg_buffersize "%tr%"

CLS
ECHO --- QCONVERT SETTINGS ---
ECHO.
ECHO Video Container : 
ECHO 1. mov
ECHO 2. mp4
ECHO 3. avi
ECHO 4. mkv
ECHO.

CHOICE /C 1234 /M "Choose an Extension"

IF ERRORLEVEL 4 setx ffmpeg_h264_extension "mkv"
IF ERRORLEVEL 3 setx ffmpeg_h264_extension "avi"
IF ERRORLEVEL 2 setx ffmpeg_h264_extension "mp4"
IF ERRORLEVEL 1 setx ffmpeg_h264_extension "mov"

CLS
ECHO --- QCONVERT SETTINGS ---
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

IF ERRORLEVEL 6 setx ffmpeg_h264_profile "high444"
IF ERRORLEVEL 5 setx ffmpeg_h264_profile "high422"
IF ERRORLEVEL 4 setx ffmpeg_h264_profile "high10"
IF ERRORLEVEL 3 setx ffmpeg_h264_profile "high"
IF ERRORLEVEL 2 setx ffmpeg_h264_profile "main"
IF ERRORLEVEL 1 setx ffmpeg_h264_profile "baseline"

CLS
ECHO --- QCONVERT SETTINGS ---
ECHO.
echo All set ! Let's QConvert !
PAUSE