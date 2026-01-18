# LiteLLM On-Premise Setup for Windows

Write-Host "Starting LiteLLM Setup..." -ForegroundColor Cyan

# 1. Create .env from .env.example if it doesn't exist
if (-not (Test-Path ".env")) {
    Write-Host "Creating .env file from .env.example..." -ForegroundColor Green
    Copy-Item ".env.example" ".env"
    Write-Host "Action Required: Please edit the .env file and add your API keys." -ForegroundColor Yellow
} else {
    Write-Host ".env file already exists." -ForegroundColor Gray
}

# 2. Check for Docker
if (Get-Command "docker" -ErrorAction SilentlyContinue) {
    Write-Host "Docker is installed." -ForegroundColor Green
} else {
    Write-Host "Warning: Docker is not installed. You will need it to run the proxy via Docker Compose." -ForegroundColor Red
}

Write-Host "`nSetup complete!" -ForegroundColor Cyan
Write-Host "Next steps:" -ForegroundColor Green
Write-Host "1. Open .env and add your API keys." -ForegroundColor Green
Write-Host "2. Run './run.ps1' to start the proxy." -ForegroundColor Green
