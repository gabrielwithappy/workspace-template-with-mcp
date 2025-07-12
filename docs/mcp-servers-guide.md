# MCP 서버별 설정 가이드

## 사용 가능한 MCP 서버들

### 1. Figma MCP 서버들

- **Framelink Figma MCP**: Figma API를 통한 파일 조작
- **TalkToFigma**: 실시간 Figma 플러그인 연동

**필요한 환경 변수:**

- `FIGMA_API_KEY`: Figma 개발자 토큰
- `FIGMA_CHANNEL`: TalkToFigma 채널 ID

### 2. Filesystem MCP

로컬 파일 시스템에 액세스하는 MCP 서버

**필요한 환경 변수:**

- `MCP_FILESYSTEM_PATH`: 액세스할 파일 시스템 경로

### 3. Memory MCP

메모리 기반 저장소를 제공하는 MCP 서버

**환경 변수:** 없음

### 4. Brave Search MCP

Brave 검색 엔진을 통한 웹 검색

**필요한 환경 변수:**

- `BRAVE_API_KEY`: Brave Search API 키

### 5. GitHub MCP

GitHub API를 통한 저장소 관리

**필요한 환경 변수:**

- `GITHUB_TOKEN`: GitHub Personal Access Token

### 6. Puppeteer MCP

웹 스크래핑 및 브라우저 자동화

**환경 변수:** 없음

### 7. SQLite MCP

SQLite 데이터베이스 관리

**필요한 환경 변수:**

- `MCP_SQLITE_DB_PATH`: SQLite 데이터베이스 파일 경로

## 사용법

1. 원하는 MCP 서버의 환경 변수를 `.env` 파일에 설정
2. `mcp.json`에서 사용하지 않는 서버는 주석 처리 또는 제거
3. VS Code 재시작하여 설정 적용

## 커스텀 MCP 서버 추가

`mcp.json` 파일에 새로운 서버 정의를 추가하세요:

```json
"Your Custom MCP": {
    "command": "node",
    "args": ["path/to/your/mcp-server.js"],
    "type": "stdio"
}
```
