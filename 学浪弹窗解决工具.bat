@echo off
setlocal enabledelayedexpansion

REM Define the list of processes to be terminated
set PROCESS_LIST=GameBar.exe XboxGameBar.exe GameBarFTServer.exe XboxGameBarWidgets.exe


echo =======================================
echo      auto check environment
echo =======================================
echo.
echo processing...
echo.

REM Check and terminate each process in the list
for %%p in (%PROCESS_LIST%) do (
    tasklist | findstr /I /C:"%%p" > nul
    if errorlevel 1 (
        echo %%p Process Success~.
    ) else (
        echo Terminating %%p...
        taskkill /f /im "%%p"
        if errorlevel 1 (
            echo Process Fail!!! %%p.
        ) else (
            echo %%p Process Success~.
        )
    )
)

echo.
echo Process Complete, Continue learning~
timeout /t 2 >nul

REM Terminate the script itself
exit
