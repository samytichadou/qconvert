::DNX PRESET

@echo off
setlocal ENABLEDELAYEDEXPANSION
set fName=%1

::CONTAINER

CLS
ECHO --- DNX SETTINGS ---
ECHO.
ECHO DNX format : 
ECHO 1. Quicktime mov
ECHO 2. MXF
ECHO.

CHOICE /C 12 /M "Choose an extension"

IF ERRORLEVEL 2 set extension=mxf
IF ERRORLEVEL 1 set extension=mov

::PROFILE

CLS
ECHO --- DNX SETTINGS ---
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

IF ERRORLEVEL 6 set profile=dnxhr_lb
IF ERRORLEVEL 5 set profile=dnxhr_sq
IF ERRORLEVEL 4 set profile=dnxhr_hq
IF ERRORLEVEL 3 set profile=dnxhr_hqx
IF ERRORLEVEL 2 set profile=dnxhr_444
IF ERRORLEVEL 1 (set profile=dnxhd
goto dnxhd_settings)

::DNXHD BITRATE

:dnxhd_settings

CLS
ECHO --- DNXHD SETTINGS ---
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

IF %bitrate%==10 (set bitrate=220
)ELSE IF %bitrate%==9 (set bitrate=185
)ELSE IF %bitrate%==8 (set bitrate=175
)ELSE IF %bitrate%==7 (set bitrate=145
)ELSE IF %bitrate%==6 (set bitrate=120
)ELSE IF %bitrate%==5 (set bitrate=115
)ELSE IF %bitrate%==4 (set bitrate=90
)ELSE IF %bitrate%==3 (set bitrate=60
)ELSE IF %bitrate%==2 (set bitrate=45
)ELSE IF %bitrate%==1 (set bitrate=36
)ELSE ( ECHO Invalid Choice
goto dnxhd_settings )

::ENCODING

if %profile% ==dnxhd (goto :dnxhd) else (goto :dnxhr)

:dnxhd
for /f "tokens=* delims= " %%F in ('echo %fName%') do (
"%ffmpeg%" -i "%%~fF" -vcodec dnxhd -b:v %bitrate%M "%%~dpnF_dnxhd%bitrate%.%extension%"
goto :end
)

:dnxhr
for /f "tokens=* delims= " %%F in ('echo %fName%') do (
"%ffmpeg%" -i "%%~fF" -c:v dnxhd -profile:v %profile% "%%~dpnF_%profile%.%extension%"
goto :end
)


:end
END