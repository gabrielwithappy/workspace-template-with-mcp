@echo off
chcp 65001 >nul
REM MCP Development Environment Setup Script
echo === MCP Development Environment Setup ===

REM Check if .env file exists
if not exist ".env" (
    if exist ".env.example" (
        echo Creating .env file from template...
        copy ".env.example" ".env" >nul
        echo + .env file created! Please edit it with your actual API keys
    ) else (
        echo Warning: .env.example not found!
        exit /b 1
    )
) else (
    echo + .env file already exists
)

REM Load environment variables (without displaying sensitive values)
echo Loading environment variables...
if exist ".env" (
    set envCount=0
    for /f "usebackq delims== tokens=1,*" %%a in (".env") do (
        REM Skip comments and empty lines
        echo %%a | findstr /r "^[^#]" >nul
        if not errorlevel 1 (
            set "%%a=%%b"
            echo   + %%a
            set /a envCount+=1
        )
    )
    echo Environment variables loaded successfully! (!envCount! variables)
)

REM Create data directory for SQLite and other data
if not exist "data" (
    mkdir "data" >nul 2>&1
    echo + Created data directory
) else (
    echo + Data directory already exists
)

REM Create logs directory
if not exist "logs" (
    mkdir "logs" >nul 2>&1
    echo + Created logs directory
) else (
    echo + Logs directory already exists
)

echo === Setup Complete ===
echo Next steps:
echo   1. Edit .env file with your API keys
echo   2. Configure mcp.json with desired servers
echo   3. Start using MCP servers in VS Code
pause
