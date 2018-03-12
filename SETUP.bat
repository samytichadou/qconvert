::QCONVERT - SET PARAMETERS

@echo off

::check previous install

if not exist "%ProgramFiles%\QConvert\" goto ok
echo.
echo --- WARNING
echo --- PREVIOUS INSTALLATION
echo Please uninstall QConvert first
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

::set ffmpeg path

ECHO --- QCONVERT SETUP ---
ECHO (You can set this later by right-click menu)
ECHO.
set /p pa="FFMPEG "Bin" folder path (without the "\" after "bin") : "
setx ffmpeg "%pa%\ffmpeg.exe"
setx ffplay "%pa%\ffplay.exe"
setx ffprobe "%pa%\ffprobe.exe"

::copy files

if not exist "%ProgramFiles%\QConvert\" mkdir "%ProgramFiles%\QConvert"
xcopy /e "%~dp0\datas\QConvert_*" "%ProgramFiles%\QConvert\"

::run reg file

REG IMPORT "%~dp0\datas\setup.reg"

CLS
ECHO --- QCONVERT SETUP ---
ECHO.
echo All set ! Let's QConvert !
PAUSE