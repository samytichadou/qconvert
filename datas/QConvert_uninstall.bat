::QCONVERT - UNINSTALL

@echo off


::check previous install

if exist "%ProgramFiles%\QConvert\" goto ok
echo.
echo --- WARNING
echo --- NO PREVIOUS INSTALLATION
echo Please install QConvert first
PAUSE
EXIT

:ok

::get admin

NET SESSION
IF %ERRORLEVEL% NEQ 0 GOTO ELEVATE
GOTO ADMINTASKS

:ELEVATE
CD /d %~dp0
MSHTA "javascript: var shell = new ActiveXObject('shell.application'); shell.ShellExecute('%~nx0', '', '', 'runas', 1);close();"
EXIT

:ADMINTASKS


::unset ffmpeg path

reg delete HKEY_CURRENT_USER\Environment /v ffmpeg /f


::unset environnement variable

reg delete HKEY_CURRENT_USER\Environment /v ffmpeg_targetrate /f
reg delete HKEY_CURRENT_USER\Environment /v ffmpeg_minrate /f
reg delete HKEY_CURRENT_USER\Environment /v ffmpeg_maxrate /f
reg delete HKEY_CURRENT_USER\Environment /v ffmpeg_buffersize /f
reg delete HKEY_CURRENT_USER\Environment /v ffmpeg_h264_profile /f
reg delete HKEY_CURRENT_USER\Environment /v ffmpeg_h264_extension /f


::unset menu regs

REGEDIT.EXE  /S  "%~dp0\QConvert_datas\QConvert_uninstall.reg"

::delete files

rmdir /s /q "%ProgramFiles%\QConvert"


CLS
ECHO --- QCONVERT UNINSTALL ---
ECHO.
ECHO -Qconverty successfully uninstalled
PAUSE