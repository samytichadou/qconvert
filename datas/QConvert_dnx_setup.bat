::QCONVERT - SET PARAMETERS

@echo off
::set environnement variable

::DNX

CLS
ECHO --- QCONVERT SETUP ---
ECHO.
ECHO DNX format : 
ECHO 1. Quicktime mov
ECHO 2. MXF
ECHO.

CHOICE /C 12 /M "Choose a format"

IF ERRORLEVEL 2 setx ffmpeg_dnx_format "mxf"
IF ERRORLEVEL 1 setx ffmpeg_dnx_format "mov"

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

CLS
ECHO --- QCONVERT SETUP ---
ECHO.
ECHO DNXHD Bitrate: 
ECHO 1. 36 - 1080p25/1080p23,976/1080p24
ECHO 2. 45 - 1080p29,7
ECHO 3. 60 - 720p23,976
ECHO 4. 90 - 720p23,976
ECHO 5. 115 - 720p50/1080p23,976/1080p24
ECHO 6. 120 - 1080i50/1080p25
ECHO 7. 145 - 1080i59,94/720p59,94
ECHO 8. 175 - 1080p24/1080p23,976/720p50
ECHO 9. 185 - 1080i50/1080p25
ECHO 10. 220 - 1080i59,94/720p59,94
ECHO.
ECHO Choose a Bitrate [1,2,3,4,5,6,7,8,9,10]

set /p bitrate=

IF %bitrate%==10 (setx ffmpeg_dnxhd_bitrate "220"
)ELSE IF %bitrate%==9 (setx ffmpeg_dnxhd_bitrate "185"
)ELSE IF %bitrate%==8 (setx ffmpeg_dnxhd_bitrate "175"
)ELSE IF %bitrate%==7 (setx ffmpeg_dnxhd_bitrate "145"
)ELSE IF %bitrate%==6 (setx ffmpeg_dnxhd_bitrate "120"
)ELSE IF %bitrate%==5 (setx ffmpeg_dnxhd_bitrate "115"
)ELSE IF %bitrate%==4 (setx ffmpeg_dnxhd_bitrate "90"
)ELSE IF %bitrate%==3 (setx ffmpeg_dnxhd_bitrate "60"
)ELSE IF %bitrate%==2 (setx ffmpeg_dnxhd_bitrate "45"
)ELSE IF %bitrate%==1 (setx ffmpeg_dnxhd_bitrate "36"
)ELSE (echo Invalid Choice)

END