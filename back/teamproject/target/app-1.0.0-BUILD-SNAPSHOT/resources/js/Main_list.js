    const contentData = [
    {
        id: 1,
        title: "썬더볼츠",
        badges: [
        { type: "new", text: "NEW" },
        { type: "hot", text: "인기" }
        ],
        rating: "8.5",
        genre: "액션/어드벤처",
        duration: "126분",
        releaseDate: "2025.04.30 개봉",
        description: "별난 놈들만 모인 이들은 어쩔 수 없이 한 팀이 되고 자신들의 어두운 과거와 맞서야 하는 위험한 임무에 투입된다 서로를 전혀 믿지 못하는 상황에서 스스로의 생존과 세상의 구원을 위해 이들은 진정한 팀으로 거듭나야만 하는데...",
        videoSrc: "./videos/썬더볼츠 메인 예고편.mp4",
        imageSrc: "./pt_img/19636c6ce2a211e76.jpg"
    },
    {
        id: 2,
        title: "A MINECRAFT MOVIE",
        badges: [
        { type: "hot", text: "인기"}
        ],
        rating: "8.7",
        genre: "어드벤처/판타지",
        duration: "100분",
        releaseDate: "2025.04.25 개봉",
        description: "현실 세계로 돌아가기 위해서는 일단 살아남아야 하는 법! 다섯명의 동글이 들을 오버월드를 구하기 위해 힘을 합치게 되는 수업이 쌓아 올린 네모난 세계 상상을 초월하는 모험이 펼쳐진다.",
        videoSrc: "./videos/마인크래프트 1차 예고편.mp4",
        imageSrc: "./pt_img/yFHHfHcUgGAxziP1C3lLt0q2T4s.webp"
    },
    {
        id: 3,
        title: "미션 임파서블 파이널 레코닝",
        badges: [
        { type: "new", text: "영화" }
        ],
        rating: "9.3",
        genre: "액션",
        duration: "169분",
        releaseDate: "2025.05.17 개봉",
        description: "디지털상의 모든 정보를 통제할 수 있는 사상초유의 무기로 인해 전세계 국가와 조직의 기능이 마비되고, 인류 전체가 위협받는 절체절명의 위기가 찾아온다.",
        videoSrc: "./videos/미션 임파서블_ 파이널 레코닝  예고편.mp4",
        imageSrc: "./pt_img/MISSION1.jpg"
    },
    {
        id: 4,
        title: "웃는 남자",
        badges: [
        { type: "new", text: "NEW" }
        ],
        rating: "예술의전당 오페라극장",
        genre: "뮤지컬",
        duration: "180분",
        releaseDate: "2025.01.09 개봉 ~ 2025.03.09 종료",
        description: "살을 에는 추위 속을 헤매던 그윈플렌은 얼어 죽은 여자의 품에 안겨 젖을 물고 있는 아기 데아를 발견하고 우연히 떠돌이 약장수 우르수스를 만나 도움을 청한다.",
        videoSrc: "./videos/웃는남자예고편.mp4",
        imageSrc: "https://image.tmdb.org/t/p/w500/8claugsQFr5SAx4K2anZPJuPRqL.jpg"
    },
    {
        id: 5,
        title: "WICKED",
        badges: [
        { type: "new", text: "NEW" }
        ],
        rating: "블루스퀘어 신한카드홀",
        genre: "뮤지컬",
        duration: "170분",
        releaseDate: "2025.07.12 개봉 ~ 2025.10.26 종료",
        description: "서로 너무나 다른 엘파바와 글린다는 마법 같은 우정을 쌓지만, 마법사의 초대로 에메랄드 시티에 간 후 예상치 못한 위기와 모험에 휘말린다.",
        videoSrc: "./videos/weak_hero.mp4",
        imageSrc: "./pt_img/위키드.webp"
    },
    {
        id: 6,
        title: "알라딘",
        badges: [
        { type: "new", text: "NEW" }
        ],
        rating: "부산 드림씨어터",
        genre: "뮤지컬",
        duration: "150분",
        releaseDate: "2025.07.11 개봉 ~ 2025.09.28 종료",
        description: "사막 속에 자리한 아그라바 왕국, 좀도둑질로 생계를 유지하는 알라딘은 우연히 마주친 공주 자스민에게 신분도 모른 채 마음을 빼앗기게되는데...",
        videoSrc: "./videos/알라딘예고편.mp4",
        imageSrc: "./pt_img/25005672_p.gif"
    },
    {
        id: 7,
        title: "헤다 가블러",
        badges: [
        { type: "new", text: "NEW" }
        ],
        rating: "LG SIGNATURE 홀",
        genre: "연극",
        duration: "145분",
        releaseDate: "2025.05.07 개봉 ~ 2025.06.08 종료",
        description: "가블러 장군의 딸 헤다가 원치 않는 결혼과 함께 겪는 갇힌 삶의 이야기",
        videoSrc: "./videos/헤다가블러 예고편.mp4",
        imageSrc: "./pt_img/L0000113_p.gif"
    },
    {
        id: 8,
        title: "킬링시저",
        badges: [
        { type: "new", text: "NEW" }
        ],
        rating: "서강대학교 메리홀 대극장",
        genre: "연극",
        duration: "90분",
        releaseDate: "2025.05.10 개봉 ~ 2025.07.20 종료",
        description: "셰익스피어의 줄리어스 시저를 현대적으로 재해석한 작품으로, 시저 암살 전후의 권력 다툼과 갈등의 이야기",
        videoSrc: "./videos/킬링시저예고편.mp4",
        imageSrc: "./pt_img/25004642_p.gif"
    },
    {
        id: 9,
        title: "행오버",
        badges: [
        { type: "new", text: "NEW" }
        ],
        rating: "정극장",
        genre: "연극",
        duration: "90분",
        releaseDate: "2023.05.01 개봉 ~ 2025.06.29 종료",
        description: "모든 일은 파라다이스 호텔 506호에 시작된다.남편(철수)의 외도를 알게 된 지연(부인)은 이벤트 업체를 이용해서 남편에게 사과를 받고 싶어한다. 이벤트 업체 대표 태민은 지연의 계획대로 철수에게 사과를 받아보려고 했지만, 만취한 철수는 지연을 506호에서 살해한다. ",
        videoSrc: "",
        imageSrc: ""
    },
    // 필요한 만큼 데이터를 추가 가능
    ];