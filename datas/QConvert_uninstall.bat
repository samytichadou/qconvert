::QCONVERT - UNINSTALL

@echo off

::get admin

NET SESSION
IF %ERRORLEVEL% NEQ 0 GOTO ELEVATE
GOTO ADMINTASKS

:ELEVATE
CD /d %~dp0
MSHTA "javascript: var shell = new ActiveXObject('shell.application'); shell.ShellExecute('%~nx0', '', '', 'runas', 1);close();"
EXIT

:ADMINTASKS

::check user decision
echo QCONVERT WILL BE UNINSTALLED
echo.
echo 
set /P c=DO YOU WANT TO PROCEED[Y/N]?
if /I "%c%" EQU "Y" goto :yes
if /I "%c%" EQU "N" goto :END

:yes
::check previous install

if exist "%ProgramFiles%\QConvert\" goto ok
echo.
echo --- WARNING
echo --- NO PREVIOUS INSTALLATION
echo Please install QConvert first
PAUSE
EXIT

:ok

::unset ffmpeg path

reg delete HKEY_CURRENT_USER\Environment /v ffmpeg /f
reg delete HKEY_CURRENT_USER\Environment /v ffplay /f
reg delete HKEY_CURRENT_USER\Environment /v ffprobe /f


::unset menu regs

REGEDIT.EXE  /S  "%~dp0\QConvert_datas\QConvert_uninstall.reg"

::delete files

rmdir /s /q "%ProgramFiles%\QConvert"


CLS
ECHO --- QCONVERT UNINSTALL ---
ECHO.
ECHO -Qconverty successfully uninstalled
PAUSE
END