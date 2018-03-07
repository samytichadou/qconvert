::QCONVERT - SET PARAMETERS

@echo off

:MENU

CLS
ECHO --- QCONVERT MENU ---
ECHO.
ECHO 1. Setup H264 conversion
ECHO.
ECHO 2. Setup DNX conversion
ECHO.
ECHO 3. Setup PRORES conversion
ECHO.
ECHO 4. Setup QUICKTIME ANIMATION conversion
ECHO.
ECHO 5. Set FFMPEG path
ECHO.
ECHO 6. Open QConvert installation folder
ECHO.
ECHO 7. Uninstall QConvert
ECHO.
ECHO 8. QUIT
ECHO.
ECHO.

CHOICE /C 12345678 /M "Choose an Extension"

IF ERRORLEVEL 8 GOTO END
IF ERRORLEVEL 7 (CALL "%~dp0QConvert_uninstall.bat"
GOTO END)
IF ERRORLEVEL 6 (CALL "%~dp0QConvert_open_folder.bat"
GOTO END)
IF ERRORLEVEL 5 (CALL "%~dp0QConvert_set_ffmpeg_manually.bat"
GOTO END)
IF ERRORLEVEL 4 (CALL "%~dp0QConvert_qt_anim_setup.bat"
GOTO END)
IF ERRORLEVEL 3 (CALL "%~dp0QConvert_prores_setup.bat"
GOTO END)
IF ERRORLEVEL 2 (CALL "%~dp0QConvert_dnx_setup.bat"
GOTO END)
IF ERRORLEVEL 1 (CALL "%~dp0QConvert_h264_setup.bat"
GOTO END)

END