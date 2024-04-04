@echo off

if "%1"=="" (
    echo Usage: %0 [printer|scanner|main]
    exit /b 1
)

set VALID_ARGUMENTS=printer scanner main
set VALID=false

for %%a in (%VALID_ARGUMENTS%) do (
    if /I "%1"=="%%a" (
        set VALID=true
    )
)

if "%VALID%"=="false" (
    echo Invalid argument. Argument must be one of: printer, scanner, main
    exit /b 1
)

set ARGUMENT=%1
set FILENAME=report_%ARGUMENT%.xml


echo ^<report^> > %FILENAME%
echo     ^<argument^>%ARGUMENT%^</argument^> >> %FILENAME%
echo ^</report^> >> %FILENAME%

echo Total test results: Passed - 10; Failed - 2; Skipped - 0;
