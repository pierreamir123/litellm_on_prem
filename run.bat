@echo off
echo Starting LiteLLM Proxy...
docker compose up -d
if %ERRORLEVEL% NEQ 0 (
    echo.
    echo Error: Failed to start Docker Compose. 
    echo Please make sure Docker Desktop is running and you have run setup.ps1.
    pause
    exit /b %ERRORLEVEL%
)
echo.
echo LiteLLM is starting at http://localhost:4000
echo To view logs, run: docker compose logs -f
pause
