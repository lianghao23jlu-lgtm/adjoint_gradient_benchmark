@echo off
setlocal
cd /d "%~dp0"

echo =======================================================================
echo  GeoEMFEM 3D CSEM Benchmark Verification & Figure Generator
echo =======================================================================
echo.

if exist "verify_benchmark.exe" (
    echo [INFO] Running verify_benchmark.exe standalone binary...
    verify_benchmark.exe
) else (
    echo [INFO] verify_benchmark.exe not found, falling back to python...
    python verify_benchmark_cli.py
)

if %ERRORLEVEL% equ 0 (
    echo.
    echo =======================================================================
    echo  [SUCCESS] All benchmark audits and 4 publication figures generated!
    echo  Figures located in .\figures\
    echo =======================================================================
) else (
    echo.
    echo  [ERROR] Benchmark execution encountered an error (Code: %ERRORLEVEL%).
)

pause
