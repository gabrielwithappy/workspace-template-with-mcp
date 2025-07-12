#!/bin/bash
# MCP Development Environment Setup Script
echo "=== MCP Development Environment Setup ==="

# Check if .env file exists
if [ ! -f ".env" ]; then
    if [ -f ".env.example" ]; then
        echo "Creating .env file from template..."
        cp ".env.example" ".env"
        echo "✓ .env file created! Please edit it with your actual API keys"
    else
        echo "Warning: .env.example not found!"
        exit 1
    fi
else
    echo "✓ .env file already exists"
fi

# Load environment variables (without displaying sensitive values)
echo "Loading environment variables..."
if [ -f ".env" ]; then
    envCount=0
    while IFS='=' read -r name value; do
        # Skip comments and empty lines
        if [[ ! "$name" =~ ^#.* ]] && [[ -n "$name" ]]; then
            export "$name"="$value"
            echo "  ✓ $name"
            ((envCount++))
        fi
    done < ".env"
    echo "Environment variables loaded successfully! ($envCount variables)"
fi

# Create data directory for SQLite and other data
if [ ! -d "data" ]; then
    mkdir -p "data"
    echo "✓ Created data directory"
else
    echo "✓ Data directory already exists"
fi

# Create logs directory
if [ ! -d "logs" ]; then
    mkdir -p "logs"
    echo "✓ Created logs directory"
else
    echo "✓ Logs directory already exists"
fi

echo "=== Setup Complete ==="
echo "📋 Next steps:"
echo "  1. Edit .env file with your API keys"
echo "  2. Configure mcp.json with desired servers"
echo "  3. Start using MCP servers in VS Code"
