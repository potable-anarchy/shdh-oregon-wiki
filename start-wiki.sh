#!/bin/bash

# SHDH Oregon Wiki Startup Script
# Usage: ./start-wiki.sh [OPTIONS]
# Options:
#   --dev     Development mode (allows editing)
#   --prod    Production mode (read-only)
#   --port    Specify port (default: 4567)
#   --help    Show this help message

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Default values
PORT=4567
MODE="dev"
HOST="0.0.0.0"
REF="main"

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --dev)
            MODE="dev"
            shift
            ;;
        --prod)
            MODE="prod"
            shift
            ;;
        --port)
            PORT="$2"
            shift 2
            ;;
        --help)
            echo "SHDH Oregon Wiki Startup Script"
            echo ""
            echo "Usage: $0 [OPTIONS]"
            echo ""
            echo "Options:"
            echo "  --dev     Development mode (allows editing, default)"
            echo "  --prod    Production mode (read-only)"
            echo "  --port    Specify port (default: 4567)"
            echo "  --help    Show this help message"
            echo ""
            echo "Examples:"
            echo "  $0                    # Start in dev mode on port 4567"
            echo "  $0 --prod             # Start in production mode"
            echo "  $0 --port 8080        # Start on port 8080"
            echo "  $0 --prod --port 80   # Production on port 80"
            exit 0
            ;;
        *)
            echo -e "${RED}Unknown option: $1${NC}"
            echo "Use --help for usage information"
            exit 1
            ;;
    esac
done

# Check if Gollum is installed
if ! command -v gollum &> /dev/null; then
    echo -e "${YELLOW}Warning: Gollum is not installed${NC}"
    echo ""
    echo "To install Gollum, run:"
    echo "  gem install gollum"
    echo ""
    echo "Or use Docker instead:"
    echo "  docker-compose up"
    exit 1
fi

# Check if we're in a git repository
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo -e "${YELLOW}Warning: Not in a git repository${NC}"
    echo "Initializing git repository..."
    git init
    git add .
    git commit -m "Initial wiki commit"
fi

# Set Gollum options based on mode
if [ "$MODE" == "prod" ]; then
    echo -e "${GREEN}Starting SHDH Oregon Wiki in PRODUCTION mode${NC}"
    echo "  - Read-only (no web editing)"
    echo "  - Port: $PORT"
    echo "  - URL: http://localhost:$PORT"
    echo ""

    GOLLUM_OPTS="--port $PORT --host $HOST --ref $REF --allow-uploads page --h1-title --no-edit"
else
    echo -e "${GREEN}Starting SHDH Oregon Wiki in DEVELOPMENT mode${NC}"
    echo "  - Editing enabled"
    echo "  - Live preview enabled"
    echo "  - Port: $PORT"
    echo "  - URL: http://localhost:$PORT"
    echo ""

    GOLLUM_OPTS="--port $PORT --host $HOST --ref $REF --allow-uploads page --live-preview --h1-title"
fi

# Additional options for better experience
GOLLUM_OPTS="$GOLLUM_OPTS --mathjax --emoji"

# Create images directory if it doesn't exist
mkdir -p images/events images/venues images/projects

# Start Gollum
echo "Starting Gollum with options: $GOLLUM_OPTS"
echo ""
echo "Press Ctrl+C to stop the server"
echo ""

# Trap Ctrl+C and exit cleanly
trap 'echo ""; echo -e "${YELLOW}Shutting down wiki server...${NC}"; exit 0' INT

# Start Gollum
gollum $GOLLUM_OPTS

# This line only runs if Gollum exits with an error
echo -e "${RED}Gollum exited unexpectedly${NC}"
exit 1
