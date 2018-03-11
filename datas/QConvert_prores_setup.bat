::QCONVERT - PRORES SETUP

@echo off

::PRORES

CLS
ECHO --- QCONVERT SETUP ---
ECHO.
ECHO DNX Profile : 
ECHO 1. DNXHD
ECHO 2. DNXHR 444 - for 4:4:4 10bits videos
ECHO 3. DNXHR HQX - for 4:2:2 10bits videos
ECHO 4. DNXHR HQ - for 4:2:2 8bits videos
ECHO 5. DNXHR SQ - for 4:2:2 8bits videos
ECHO 6. DNXHR LB - for 4:2:2 8bits videos
ECHO.

CHOICE /C 123456 /M "Choose a Profile"

IF ERRORLEVEL 6 setx ffmpeg_dnx_profile "dnxhr_lb"
IF ERRORLEVEL 5 setx ffmpeg_dnx_profile "dnxhr_sq"
IF ERRORLEVEL 4 setx ffmpeg_dnx_profile "dnxhr_hq"
IF ERRORLEVEL 3 setx ffmpeg_dnx_profile "dnxhr_hqx"
IF ERRORLEVEL 2 setx ffmpeg_dnx_profile "dnxhr_444"
IF ERRORLEVEL 1 setx ffmpeg_dnx_profile "dnxhd"

END
