::QCONVERT - SET PARAMETERS

@echo off

:MENU

CLS
ECHO --- QCONVERT MENU ---
ECHO.
ECHO 1. Set FFMPEG path
ECHO.
ECHO 2. Open QConvert installation folder
ECHO.
ECHO 3. Uninstall QConvert
ECHO.
ECHO 4. QUIT
ECHO.
ECHO.

CHOICE /C 1234 /M "Choose an Extension"

IF ERRORLEVEL 4 GOTO END
IF ERRORLEVEL 3 (CALL "%~dp0QConvert_uninstall.bat"
GOTO END)
IF ERRORLEVEL 2 (CALL "%~dp0QConvert_open_folder.bat"
GOTO END)
IF ERRORLEVEL 1 (CALL "%~dp0QConvert_set_ffmpeg_manually.bat"
GOTO END)

END