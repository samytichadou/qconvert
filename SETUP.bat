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

::copy files

if not exist "%ProgramFiles%\QConvert\" mkdir "%ProgramFiles%\QConvert"
xcopy /e "%~dp0\datas\QConvert_*" "%ProgramFiles%\QConvert\"

::run reg file

REG IMPORT "%~dp0\datas\setup.reg"

powershell (New-Object -ComObject Wscript.Shell).Popup("""QConvert installed - Don't forget to set ffmpeg path !""",0,"""Installation Finished""",0x40)
END