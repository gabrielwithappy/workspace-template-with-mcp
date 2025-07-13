# workspace-template-with-mcp

다양한 Model Context Protocol (MCP) 서버를 활용한 개발을 위한 템플릿 워크스페이스입니다.

## 🚀 빠른 시작

### 1. 워크스페이스 설정

```bash
# 1. 이 템플릿을 복제하거나 다운로드
git clone <repository-url> my-mcp-project
cd my-mcp-project

# 2. VS Code에서 워크스페이스 열기
code mcp-workspace.code-workspace
```

### 2. MCP 환경 설정

설정 스크립트는 다음 작업을 수행합니다:

- `.env.example`을 복사하여 `.env` 파일 생성
- MCP 서버들이 사용할 환경변수 템플릿 제공
- 필요한 디렉토리 생성 (`data/`, `logs/`)
- MCP 클라이언트가 참조할 MCP 설정 파일 확인

**Windows (PowerShell):**

```powershell
# PowerShell에서 설정 스크립트 실행
.\scripts\setup.ps1
```

**Windows (Command Prompt):**

```cmd
# Command Prompt에서 설정 스크립트 실행
scripts\setup.bat
```

**macOS/Linux (Bash):**

```bash
# Make script executable (first time only)
chmod +x scripts/setup.sh
# Run setup script
./scripts/setup.sh
```

또는 VS Code에서:

- `Ctrl+Shift+P` → `Tasks: Run Task` → `Setup MCP Environment`

### 3. 환경 변수 구성

설정 스크립트 실행 후, `.env` 파일을 편집하여 각 MCP 서버가 필요로 하는 API 키와 설정을 입력하세요.
이 환경변수들은 MCP 클라이언트가 MCP 서버를 실행할 때 자동으로 로드됩니다:

```env
# Figma MCP 서버용
FIGMA_API_KEY=your_figma_api_key_here
FIGMA_CHANNEL=your_channel_id_here

# GitHub MCP 서버용
GITHUB_TOKEN=your_github_token_here

# Brave Search MCP 서버용
BRAVE_API_KEY=your_brave_api_key_here

# 기타 MCP 서버 설정...
```

> **참고**: 각 MCP 서버는 `mcp.json` 파일에서 정의된 환경변수를 참조하여 동작합니다.

## 📦 포함된 MCP 서버들

### 디자인 도구

- **Framelink Figma MCP**: Figma API 통합
- **TalkToFigma**: Figma component 생성 및 수정

### 개발 도구

- **Memory MCP**: 메모리 기반 데이터 저장 및 관리
  - 대화 컨텍스트, 프로젝트 정보, 학습 데이터 등을 JSON 형태로 저장
  - `data/` 폴더에 자동으로 백업 파일 생성

### 유틸리티

- **Puppeteer MCP**: 웹 스크래핑 및 자동화

자세한 설정 방법은 [MCP 서버 가이드](docs/mcp-servers-guide.md)를 참조하세요.

## 🛠️ 커스터마이징

### MCP 서버 추가/제거

`mcp.json` 파일을 편집하여 필요한 서버만 활성화하거나 새로운 서버를 추가할 수 있습니다.
이 파일은 MCP 클라이언트가 읽어서 MCP 서버들을 자동으로 시작하고 관리합니다.

```json
{
  "mcpServers": {
    "memory": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-memory"],
      "env": {
        "MEMORY_STORE_PATH": "./data"
      }
    },
    "figma": {
      "command": "npx",
      "args": ["-y", "@framelink/figma-mcp-server"],
      "env": {
        "FIGMA_API_KEY": "${FIGMA_API_KEY}",
        "FIGMA_CHANNEL": "${FIGMA_CHANNEL}"
      }
    },
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_TOKEN": "${GITHUB_TOKEN}"
      }
    }
  }
}
```

**서버 활성화/비활성화 방법:**

1. **서버 비활성화**: 해당 서버 전체 블록을 `mcp.json`에서 삭제
2. **서버 활성화**: 필요한 서버 설정을 `mcpServers` 객체에 추가
3. **환경변수 설정**:
   - `.env` 파일에서 실제 값 설정
   - `mcp.json`에서 `${변수명}` 형태로 참조

**예시 - GitHub 서버 비활성화:**

```json
{
  "mcpServers": {
    "memory": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-memory"],
      "env": {
        "MEMORY_STORE_PATH": "./data"
      }
    },
    "figma": {
      "command": "npx",
      "args": ["-y", "@framelink/figma-mcp-server"],
      "env": {
        "FIGMA_API_KEY": "${FIGMA_API_KEY}",
        "FIGMA_CHANNEL": "${FIGMA_CHANNEL}"
      }
    }
  }
}
```

> **참고**: GitHub 서버를 비활성화하려면 해당 `"github"` 섹션 전체를 삭제하면 됩니다.

## 📁 프로젝트 구조

```text
workspace-template-with-mcp/
├── mcp.json                    # MCP 클라이언트용 서버 설정 파일
├── workspace-template-with-mcp.code-workspace # VS Code 워크스페이스 설정
├── .env                        # MCP 서버용 환경 변수 (로컬)
├── .env.example               # 환경 변수 템플릿
├── data/                      # Memory MCP 데이터 저장소
│   ├── memory.json           # 메인 메모리 데이터
│   ├── memory_backup.json    # 백업 파일
│   └── memory_fixed.json     # 수정된 메모리 데이터
├── scripts/                   # MCP 환경 설정 스크립트
│   ├── setup.ps1             # Windows PowerShell
│   ├── setup.bat             # Windows Command Prompt
│   └── setup.sh              # macOS/Linux Bash
├── docs/                      # 문서
│   └── mcp-servers-guide.md
└── logs/                      # 로그 파일 (setup 스크립트로 생성)
```

## 🔧 VS Code 설정

이 워크스페이스는 다음과 같은 VS Code 확장을 권장합니다:

- JSON 언어 지원
- PowerShell 지원

## 🔒 보안 주의사항

- `.env` 파일은 절대 Git에 커밋하지 마세요
- `data` 폴더(예: memory.json)는 중요한 개인정보 및 프로젝트 컨텍스트가 저장되므로 반드시 `.gitignore`에 추가하여 Git에 업로드되지 않도록 관리하세요
- API 키는 안전하게 보관하세요
- 프로덕션 환경에서는 환경 변수를 별도로 관리하세요

## 🛠️ 개발환경 의존성 안내

이 워크스페이스의 MCP 서버 설정(`mcp.json`)에 따라 다음과 같은 의존성이 필요합니다.

### 1. Node.js & npm

- 대부분의 MCP 서버(`npx` 명령어 사용)는 Node.js와 npm이 필요합니다.
- [Node.js 공식 다운로드](https://nodejs.org/)

### 2. Bun & bunx (TalkToFigma MCP 전용)

- **TalkToFigma MCP** 서버(`bunx` 명령어 사용)는 Bun 런타임이 필요합니다.
- [Bun 공식 설치 안내](https://bun.sh/)
- Windows 설치 예시 (PowerShell):

  ```powershell
  iwr https://bun.sh/install.ps1 | iex
  ```

- 설치 후 `bunx --version`으로 정상 설치 확인

### 3. 환경 변수

- `.env` 파일에 다음과 같은 값이 필요합니다:
  - `FIGMA_API_KEY`
  - `FIGMA_CHANNEL`
  - 기타 MCP 서버별 API 키

### 4. 참고

- 각 MCP 서버는 별도의 패키지 설치 없이 npx/bunx로 실행됩니다.
- Bun이 설치되어 있지 않으면 **TalkToFigma MCP**의 `bunx` 명령어가 동작하지 않습니다.
- Node.js가 설치되어 있지 않으면 `npx` 명령어가 동작하지 않습니다.

## 📄 라이선스

이 템플릿은 MIT 라이선스 하에 제공됩니다.
