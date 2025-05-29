# team_project / 추가로 본인 코드 올리는것은 feature/[본인이름] 에서 하시면 됩니다. Main 은 최종 배포할때만 사용할꺼라서 절대 건드시면 안되요

1) 팀 프로젝트 GitHub 협업 가이드
팀플에서 GitHub를 효율적으로 사용하기 위한 기본 전략과 주의사항을 정리한 문서

2) 기본 흐름
1. 팀장이 GitHub에 Repository 생성 및 팀원 초대
2. 팀원들은 `git clone`으로 프로젝트 복사
3. 각자 `feature/작업명` 브랜치에서 개발
4. 기능 완성 후 Pull Request 생성
5. 코드 리뷰 및 승인 → `main`에 Merge

---

3) 브랜치
- `main`: 완성된 코드만 존재 (직접 푸시 금지)
- `feature/기능명`: 각자 맡은 기능 개발용
- `hotfix/버그명`: 긴급 수정사항 처리

4) bash
git checkout -b feature/login-api
