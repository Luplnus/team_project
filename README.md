# team_project / 추가로 본인 코드 올리는것은 feature/[본인이름] 에서 하시면 됩니다. Main 은 최종 배포할때만 사용할꺼라서 절대 건드시면 안되요

1)팀원별 작업 및 PR 가이드 (GitHub Desktop 기준)
-팀원들은 아래 순서에 따라 자신의 브랜치에서 작업 후 `dev` 브랜치로 Pull Request를 보냅니다.

2)레포지토리 클론
- GitHub Desktop 실행 → `File > Clone repository`
- URL 탭 선택 후 아래 주소 입력:

- 로컬 저장 위치 선택 후 `Clone` 클릭

---

3)브랜치 생성 (기준: dev)
-좌측 상단 `Current Branch` → `dev` 선택  
-다시 `Current Branch` 클릭 → `New Branch...`  
-브랜치 이름을 `feature/본인이름` 형식으로 입력  
-`Create Branch` 클릭(여기까지는 제가 생성해놧습니다 -> feature/[본인이름] 에서 작업하시면되요

4)본인 브랜치에서 작업하기
- 파일 탐색기에서 프로젝트 열기 (`Show in Finder`)
- 본인 기능 구현 (예: `backend/python/` 또는 `frontend/` 안에)
- 완료 후 GitHub Desktop에서 변경된 파일 확인

5)커밋 & 푸시
- GitHub Desktop 좌측 `Summary`에 커밋 메시지 작성  
- `Commit to feature/본인이름` 클릭
- 우측 상단 `Push origin` 클릭

---
6) PR(Pull Request) 생성

- GitHub 웹사이트로 이동: https://github.com/Luplnus/team_project
- `Compare & pull request` 클릭 또는 `Pull requests > New pull request`

- 설정:
- base: `dev`
- compare: `feature/본인이름`

7) 제목 및 설명 작성 후 `Create pull request` 클릭

---
8) 브랜치 네이밍 규칙

| 브랜치 이름         | 용도           |
|----------------------|----------------|
| `main`               | 🔒 최종 배포용 (건들지 않음)  
| `dev`                | 🛠 팀 통합 개발용  
| `feature/이름`       | ✏️ 개인 기능 개발 브랜치

---

9)  예시 커밋 메시지
- 작업이 끝난 팀원은 반드시 `dev`로 Pull Request를 보낸 후 팀장이 머지합니다.
