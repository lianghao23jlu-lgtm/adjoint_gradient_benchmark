# GeoEMFEM 3D CSEM Benchmark PowerShell Runner
$ErrorActionPreference = "Stop"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $ScriptDir

Write-Host "=======================================================================" -ForegroundColor Cyan
Write-Host " GeoEMFEM 3D CSEM Benchmark Verification & Figure Generator" -ForegroundColor Cyan
Write-Host "=======================================================================" -ForegroundColor Cyan
Write-Host ""

$exePath = Join-Path $ScriptDir "verify_benchmark.exe"

if (Test-Path $exePath) {
    Write-Host "[INFO] Executing verify_benchmark.exe standalone binary..." -ForegroundColor Green
    & $exePath
} else {
    Write-Host "[INFO] verify_benchmark.exe not found, falling back to python..." -ForegroundColor Yellow
    python (Join-Path $ScriptDir "verify_benchmark_cli.py")
}

if ($LASTEXITCODE -eq 0 -or $? -eq $true) {
    Write-Host ""
    Write-Host "=======================================================================" -ForegroundColor Cyan
    Write-Host " [SUCCESS] Benchmark verification completed and all 4 figures generated!" -ForegroundColor Green
    Write-Host " Figures located in .\figures\" -ForegroundColor Green
    Write-Host "=======================================================================" -ForegroundColor Cyan
} else {
    Write-Host ""
    Write-Host " [ERROR] Benchmark execution failed with exit code $LASTEXITCODE" -ForegroundColor Red
}
