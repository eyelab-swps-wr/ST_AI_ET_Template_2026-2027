@echo off
setlocal
cd /d "%~dp0"

set "PYTHON_EXE="
if defined PSYCHOPY_PYTHON if exist "%PSYCHOPY_PYTHON%" set "PYTHON_EXE=%PSYCHOPY_PYTHON%"
if not defined PYTHON_EXE if exist "..\PsychoPy\python.exe" set "PYTHON_EXE=%~dp0..\PsychoPy\python.exe"
if not defined PYTHON_EXE if exist "..\.venv\Scripts\python.exe" set "PYTHON_EXE=%~dp0..\.venv\Scripts\python.exe"
if not defined PYTHON_EXE if exist "%ProgramFiles%\PsychoPy\python.exe" set "PYTHON_EXE=%ProgramFiles%\PsychoPy\python.exe"
if not defined PYTHON_EXE if exist "%LOCALAPPDATA%\Programs\PsychoPy\python.exe" set "PYTHON_EXE=%LOCALAPPDATA%\Programs\PsychoPy\python.exe"

if defined PYTHON_EXE goto run_python
where py >nul 2>nul
if not errorlevel 1 goto run_py_launcher

for /f "delims=" %%P in ('where python 2^>nul') do call :set_python "%%P"
if defined PYTHON_EXE goto run_python

echo Python 3 was not found. Install PsychoPy or Python 3.
echo For a custom installation, set PSYCHOPY_PYTHON to the full path of python.exe.
pause
exit /b 1

:run_python
"%PYTHON_EXE%" ai_template_app.py
set "APP_EXIT_CODE=%ERRORLEVEL%"
goto finish

:run_py_launcher
py -3 ai_template_app.py
set "APP_EXIT_CODE=%ERRORLEVEL%"

:finish
if not "%APP_EXIT_CODE%"=="0" (
	echo.
	echo The template could not start. If dependencies are missing, run ..\install_deps.bat first.
)
pause
exit /b %APP_EXIT_CODE%

:set_python
if defined PYTHON_EXE exit /b
echo(%~1| findstr /i /c:"WindowsApps" >nul
if errorlevel 1 set "PYTHON_EXE=%~1"
exit /b
