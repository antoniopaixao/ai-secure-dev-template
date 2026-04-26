# Local quality checks for Windows PowerShell
# Run from repository root:
#   .\scripts\check-local.ps1

$ErrorActionPreference = "Stop"

Write-Host "Installing development tools..." -ForegroundColor Cyan
python -m pip install --upgrade pip
python -m pip install -r requirements-dev.txt

if (Test-Path "requirements.txt") {
    Write-Host "Installing runtime dependencies..." -ForegroundColor Cyan
    python -m pip install -r requirements.txt
}

Write-Host "Running ruff..." -ForegroundColor Cyan
ruff check .

$pythonFiles = Get-ChildItem -Path "app" -Filter "*.py" -Recurse -ErrorAction SilentlyContinue
if ($pythonFiles.Count -gt 0) {
    Write-Host "Running mypy..." -ForegroundColor Cyan
    mypy app

    Write-Host "Running bandit..." -ForegroundColor Cyan
    bandit -r app -c pyproject.toml
}
else {
    Write-Host "No Python files found under app/. Skipping mypy and bandit." -ForegroundColor Yellow
}

Write-Host "Running pytest..." -ForegroundColor Cyan
pytest

$runtimeDependencies = Get-Content "requirements.txt" -ErrorAction SilentlyContinue | Where-Object {
    $_.Trim() -ne "" -and -not $_.Trim().StartsWith("#")
}

if ($runtimeDependencies.Count -gt 0) {
    Write-Host "Running pip-audit..." -ForegroundColor Cyan
    pip-audit -r requirements.txt
}
else {
    Write-Host "No runtime dependencies found in requirements.txt. Skipping pip-audit." -ForegroundColor Yellow
}

Write-Host "Local checks completed." -ForegroundColor Green
