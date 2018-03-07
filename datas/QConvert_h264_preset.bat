::H264 PRESET

@echo off
setlocal ENABLEDELAYEDEXPANSION
set fName=%1

if %ffmpeg_h264_profile% ==high444 (goto :444) else (
	 if %ffmpeg_h264_profile% ==high422 (goto :422) else (goto :420))

:444
for /f "tokens=* delims= " %%F in ('echo %fName%') do (
"%ffmpeg%" -i "%%~fF" -c:v libx264 -profile:v %ffmpeg_h264_profile% -b:v %ffmpeg_targetrate%M -minrate %ffmpeg_minrate%M -maxrate %ffmpeg_maxrate%M -bufsize %ffmpeg_buffersize%M "%%~dpnF_h264.%ffmpeg_h264_extension%"
goto :end
)

:422
for /f "tokens=* delims= " %%F in ('echo %fName%') do (
"%ffmpeg%" -i "%%~fF" -c:v libx264 -profile:v %ffmpeg_h264_profile% -pix_fmt yuv422p -b:v %ffmpeg_targetrate%M -minrate %ffmpeg_minrate%M -maxrate %ffmpeg_maxrate%M -bufsize %ffmpeg_buffersize%M "%%~dpnF_h264.%ffmpeg_h264_extension%"
goto :end
)

:420
for /f "tokens=* delims= " %%F in ('echo %fName%') do (
"%ffmpeg%" -i "%%~fF" -c:v libx264 -profile:v %ffmpeg_h264_profile% -pix_fmt yuv420p -b:v %ffmpeg_targetrate%M -minrate %ffmpeg_minrate%M -maxrate %ffmpeg_maxrate%M -bufsize %ffmpeg_buffersize%M "%%~dpnF_h264.%ffmpeg_h264_extension%"
goto :end
)

:end
echo.
echo.
echo Encoding Finished
PAUSE