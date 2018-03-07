::H264 PRESET

@echo off
setlocal ENABLEDELAYEDEXPANSION
set fName=%1

if %ffmpeg_dnx_profile% ==dnxhd (goto :dnxhd) else (goto :dnxhr)

:dnxhd
for /f "tokens=* delims= " %%F in ('echo %fName%') do (
"%ffmpeg%" -i "%%~fF" -vcodec dnxhd -b:v %ffmpeg_dnxhd_bitrate%M "%%~dpnF_dnxhd%ffmpeg_dnxhd_bitrate%.%ffmpeg_dnx_format%"
goto :end
)

:dnxhr
for /f "tokens=* delims= " %%F in ('echo %fName%') do (
"%ffmpeg%" -i "%%~fF" -c:v dnxhd -profile:v %ffmpeg_dnx_profile% "%%~dpnF_%ffmpeg_dnx_profile%.%ffmpeg_dnx_format%"
goto :end
)


:end
echo.
echo.
echo Encoding Finished
PAUSE
END