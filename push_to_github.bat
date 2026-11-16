@echo off
setlocal
cd /d "%~dp0"

echo =======================================================================
echo  GeoEMFEM Benchmark - GitHub Auto Sync Helper
echo =======================================================================
echo.
echo Target Repository: https://github.com/lianghao23jlu-lgtm/adjoint_gradient_benchmark.git
echo Branch: main
echo.

:: Stage all local modifications
git add .

:: Check if there are any uncommitted changes
git diff-index --quiet HEAD --
if %ERRORLEVEL% neq 0 (
    echo [INFO] Detected modified files, creating a new commit...
    git commit -m "Update benchmark files and figures (%date% %time%)"
) else (
    echo [INFO] Working directory is clean, proceeding to push...
)

echo [INFO] Pushing commits to GitHub...
git push -u origin main

if %ERRORLEVEL% equ 0 (
    echo.
    echo =======================================================================
    echo  [SUCCESS] Successfully synced all updates to GitHub!
    echo  URL: https://github.com/lianghao23jlu-lgtm/adjoint_gradient_benchmark
    echo =======================================================================
) else (
    echo.
    echo  [ERROR] Git push encountered an error (Code: %ERRORLEVEL%).
)

echo.
pause
