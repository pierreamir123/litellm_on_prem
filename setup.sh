#!/bin/bash

# LiteLLM On-Premise Setup for Linux

# Colors for output
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${CYAN}Starting LiteLLM Setup...${NC}"

# 1. Create .env from .env.example if it doesn't exist
if [ ! -f ".env" ]; then
    echo -e "${GREEN}Creating .env file from .env.example...${NC}"
    cp .env.example .env
    echo -e "${YELLOW}Action Required: Please edit the .env file and add your API keys/Master Key.${NC}"
else
    echo -e " .env file already exists."
fi

# 2. Check for Docker
if command -v docker >/dev/null 2>&1; then
    echo -e "${GREEN}Docker is installed.${NC}"
else
    echo -e "${RED}Warning: Docker is not installed. You will need it to run the proxy.${NC}"
fi

# 3. Check for Docker Compose
if docker compose version >/dev/null 2>&1; then
    echo -e "${GREEN}Docker Compose is available.${NC}"
else
    echo -e "${RED}Warning: Docker Compose (v2) is not available. Please install it.${NC}"
fi

# 4. Set permissions
chmod +x run.sh

echo -e "\n${CYAN}Setup complete!${NC}"
echo -e "${GREEN}Next steps:${NC}"
echo -e "1. Open .env and add your API keys and set LITELLM_MASTER_KEY."
echo -e "2. Run './run.sh' to start the proxy."
