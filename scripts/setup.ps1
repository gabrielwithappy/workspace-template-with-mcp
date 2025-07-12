# MCP Development Environment Setup Script
# Set console output encoding to UTF-8
$OutputEncoding = [System.Text.Encoding]::UTF8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

Write-Host "=== MCP Development Environment Setup ===" -ForegroundColor Green

# Check if .env file exists
if (-not (Test-Path ".env")) {
    if (Test-Path ".env.example") {
        Write-Host "Creating .env file from template..." -ForegroundColor Yellow
        Copy-Item ".env.example" ".env"
        Write-Host "+ .env file created! Please edit it with your actual API keys" -ForegroundColor Yellow
    }
    else {
        Write-Host "Warning: .env.example not found!" -ForegroundColor Red
        exit 1
    }
}
else {
    Write-Host "+ .env file already exists" -ForegroundColor Green
}

# Load environment variables (without displaying sensitive values)
Write-Host "Loading environment variables..." -ForegroundColor Blue
if (Test-Path ".env") {
    $envCount = 0
    Get-Content ".env" | ForEach-Object {
        if ($_ -match "^([^=]+)=(.*)$" -and -not $_.StartsWith("#")) {
            $name = $matches[1]
            $value = $matches[2]
            [Environment]::SetEnvironmentVariable($name, $value, "Process")
            Write-Host "  + $name" -ForegroundColor Gray
            $envCount++
        }
    }
    Write-Host "Environment variables loaded successfully! ($envCount variables)" -ForegroundColor Green
}

# Create data directory for SQLite and other data
if (-not (Test-Path "data")) {
    New-Item -ItemType Directory -Path "data" | Out-Null
    Write-Host "+ Created data directory" -ForegroundColor Green
}
else {
    Write-Host "+ Data directory already exists" -ForegroundColor Green
}

# Create logs directory
if (-not (Test-Path "logs")) {
    New-Item -ItemType Directory -Path "logs" | Out-Null
    Write-Host "+ Created logs directory" -ForegroundColor Green
}
else {
    Write-Host "+ Logs directory already exists" -ForegroundColor Green
}

Write-Host "=== Setup Complete ===" -ForegroundColor Green
Write-Host "Next steps:" -ForegroundColor Cyan
Write-Host "  1. Edit .env file with your API keys" -ForegroundColor White
Write-Host "  2. Configure mcp.json with desired servers" -ForegroundColor White
Write-Host "  3. Start using MCP servers in VS Code" -ForegroundColor White
