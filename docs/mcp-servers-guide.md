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

지식 그래프 기반의 지속적인 메모리 시스템을 제공하는 MCP 서버

**사용 목적:**

- AI 어시스턴트가 대화 간에 정보를 기억하고 관리
- 사용자의 선호도, 습관, 관계 등을 학습하고 저장
- 개인화된 대화 경험을 위한 지식 축적
- 엔티티(사람, 조직, 이벤트)와 관계, 관찰 정보를 구조적으로 저장

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
