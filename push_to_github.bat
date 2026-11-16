@echo off
setlocal
cd /d "%~dp0"

echo =======================================================================
echo  Pushing GeoEMFEM Benchmark to GitHub: lianghao23jlu-lgtm
echo =======================================================================
echo.
echo Target Repository: https://github.com/lianghao23jlu-lgtm/adjoint_gradient_benchmark.git
echo Branch: main
echo.

git push -u origin main

if %ERRORLEVEL% equ 0 (
    echo.
    echo =======================================================================
    echo  [SUCCESS] Successfully pushed all files to GitHub!
    echo  URL: https://github.com/lianghao23jlu-lgtm/adjoint_gradient_benchmark
    echo =======================================================================
) else (
    echo.
    echo  [ERROR] Git push encountered an error (Code: %ERRORLEVEL%).
)

echo.
pause
