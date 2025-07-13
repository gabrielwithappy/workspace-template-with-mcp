# MCP Development Workspace

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

### 2. 환경 설정

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

- `Ctrl+Shift+P` → `Tasks: Run Task` → `Setup MCP Environment (PowerShell)`

### 3. 환경 변수 구성

`.env` 파일을 편집하여 사용할 MCP 서버의 API 키와 설정을 입력하세요:

```env
# Figma MCP
FIGMA_API_KEY=your_figma_api_key_here
FIGMA_CHANNEL=your_channel_id_here

# GitHub MCP
GITHUB_TOKEN=your_github_token_here

# Brave Search MCP
BRAVE_API_KEY=your_brave_api_key_here

# 기타 설정...
```

## 📦 포함된 MCP 서버들

### 디자인 도구

- **Framelink Figma MCP**: Figma API 통합
- **TalkToFigma**: 실시간 Figma 플러그인 연동

### 개발 도구

- **GitHub MCP**: Git 저장소 관리
- **Memory MCP**: 메모리 기반 데이터 저장

### 유틸리티

- **Brave Search MCP**: 웹 검색 기능
- **Puppeteer MCP**: 웹 스크래핑 및 자동화

자세한 설정 방법은 [MCP 서버 가이드](docs/mcp-servers-guide.md)를 참조하세요.

## 🛠️ 커스터마이징

### MCP 서버 추가/제거

`mcp.json` 파일을 편집하여 필요한 서버만 활성화하거나 새로운 서버를 추가할 수 있습니다.

## 📁 프로젝트 구조

```
mcp-workspace/
├── mcp.json                    # MCP 서버 설정
├── mcp-workspace.code-workspace # VS Code 워크스페이스 설정
├── .env                        # 환경 변수 (로컬)
├── .env.example               # 환경 변수 템플릿
├── scripts/                   # 설정 스크립트
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

이 워크스페이스의 MCP 서버 설정(`.vscode/mcp.json`)에 따라 다음과 같은 의존성이 필요합니다.

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
