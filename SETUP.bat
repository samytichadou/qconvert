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

ECHO --- QConvert Installation ---

::set environnement variable

setx ffmpeg_targetrate "15"
setx ffmpeg_minrate "10"
setx ffmpeg_maxrate "20"
setx ffmpeg_buffersize "5"
setx ffmpeg_h264_extension "mov"
setx ffmpeg_h264_profile "main"
setx ffmpeg_dnx_profile "dnxhd"
setx ffmpeg_dnxhd_bitrate "120"
setx ffmpeg_dnx_format "mov"


::copy files

if not exist "%ProgramFiles%\QConvert\" mkdir "%ProgramFiles%\QConvert"
xcopy /e "%~dp0\datas\QConvert_*" "%ProgramFiles%\QConvert\"

::run reg file

REG IMPORT "%~dp0\datas\setup.reg"

powershell (New-Object -ComObject Wscript.Shell).Popup("""QConvert installed - Don't forget to set ffmpeg path !""",0,"""Installation Finished""",0x40)
END