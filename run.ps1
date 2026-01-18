# LiteLLM Runner for Windows

Write-Host "Checking Docker status..." -ForegroundColor Cyan

# Check if Docker engine is running
docker info >$null 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Host "Error: Docker engine is not running." -ForegroundColor Red
    Write-Host "Please start 'Docker Desktop' and wait for it to be ready." -ForegroundColor Yellow
    exit 1
}

Write-Host "Starting LiteLLM Proxy via Docker Compose..." -ForegroundColor Cyan

# Check if .env is still default or empty
if (Test-Path ".env") {
    $envContent = Get-Content ".env" -Raw
    if ($envContent -like "*sk-...*" -or $envContent -like "*sk-master-key-here*") {
        Write-Host "Action Required: Please edit your .env file and set a real LITELLM_MASTER_KEY." -ForegroundColor Yellow
        Write-Host "This key is required to log in to the Admin Panel at http://localhost:4000" -ForegroundColor Gray
    }
}

Write-Host "Launching LiteLLM with Database..." -ForegroundColor Green
docker compose up -d --remove-orphans

Write-Host "`nLiteLLM is starting..." -ForegroundColor Green
Write-Host "API Base URL: http://localhost:4000" -ForegroundColor Cyan
Write-Host "Documentation: https://docs.litellm.ai" -ForegroundColor Cyan
Write-Host "`nTo see logs, run: docker compose logs -f" -ForegroundColor White
Write-Host "To stop, run: docker compose down" -ForegroundColor White
