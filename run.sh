#!/bin/bash

# LiteLLM Runner for Linux

# Colors for output
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${CYAN}Checking Docker status...${NC}"

# Check if Docker engine is running
if ! docker info >/dev/null 2>&1; then
    echo -e "${RED}Error: Docker engine is not running.${NC}"
    echo -e "${YELLOW}Please start Docker and try again.${NC}"
    exit 1
fi

# Check if .env is still default or empty
if [ -f ".env" ]; then
    if grep -q "sk-...\|sk-master-key-here" ".env"; then
        echo -e "${YELLOW}Action Required: Please edit your .env file and set a real LITELLM_MASTER_KEY.${NC}"
        echo -e "This key is required to log in to the Admin Panel at http://localhost:4000${NC}"
    fi
fi

echo -e "${GREEN}Launching LiteLLM with Database...${NC}"
docker compose up -d --remove-orphans

echo -e "\n${GREEN}LiteLLM is starting...${NC}"
echo -e "${CYAN}API Base URL: http://localhost:4000${NC}"
echo -e "${CYAN}Documentation: https://docs.litellm.ai${NC}"
echo -e "\nTo see logs, run: ${NC}docker compose logs -f"
echo -e "To stop, run: ${NC}docker compose down"
