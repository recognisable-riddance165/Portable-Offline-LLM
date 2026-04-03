@echo off
setlocal enabledelayedexpansion

:: =====================================================================
:: 🔌 Portable AI USB Launcher
:: =====================================================================
:: This script automatically scans the /models folder and lets you
:: select which LLM to run.
:: =====================================================================

title Portable AI Launcher
color 0B

echo.
echo  [113m[1m =========================================== [0m
echo  [113m[1m 🖥️  Portable LLM Launcher                [0m
echo  [113m[1m =========================================== [0m
echo.

set "MODEL_PATH=models"
set "BIN=llamafile.exe"

:: Check if llamafile.exe exists
if not exist "%BIN%" (
    echo  [91m[!] Error: %BIN% not found in root directory. [0m
    echo      Please place llamafile.exe in the same folder as this script.
    pause
    exit /b
)

:: Scan for models
set count=0
echo  [94mSearching for models in /%MODEL_PATH%... [0m
echo.

for %%f in ("%MODEL_PATH%\*.gguf") do (
    set /a count+=1
    set "model[!count!]=%%~nxf"
    echo  [!count!] %%~nxf
)

if %count%==0 (
    echo  [91m[!] No .gguf models found in /%MODEL_PATH% [0m
    echo      Place your model files in the 'models' folder and restart.
    pause
    exit /b
)

echo.
set /p choice="👉 Select a model (1-%count%) or 'q' to quit: "

if /i "%choice%"=="q" exit /b
if "%choice%"=="" exit /b

set "SELECTED_MODEL=!model[%choice%]!"

if "!SELECTED_MODEL!"=="" (
    echo  [91m[!] Invalid selection. [0m
    pause
    goto :eof
)

echo.
echo  [94m[+] Choose a Browser Mode: [0m
echo  [1] Standard (Default)
echo  [2] Chrome (Incognito)
echo  [3] Edge (InPrivate)
echo  [4] Firefox (Private)
echo.
set /p mode="👉 Select mode (1-4): "

echo.
echo  [92m[+] Launching !SELECTED_MODEL!... [0m

:: Start Llamafile in the background
start /b "" "%BIN%" -m "%MODEL_PATH%\!SELECTED_MODEL!"

:: Wait 3 seconds for the server to start
timeout /t 3 /nobreak >nul

:: Launch browser based on selection
if "%mode%"=="2" (
    start chrome --incognito "http://localhost:8080"
) else if "%mode%"=="3" (
    start msedge --inprivate "http://localhost:8080"
) else if "%mode%"=="4" (
    start firefox --private-window "http://localhost:8080"
) else (
    start http://localhost:8080
)

pause
