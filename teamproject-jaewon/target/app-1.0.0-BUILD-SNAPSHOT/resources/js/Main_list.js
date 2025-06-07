// 1. 먼저 콘텐츠 데이터를 배열로 정의합니다
    const contentData = [
    {
        id: 1,
        title: "약한영웅 Class 2",
        badges: [
        { type: "new", text: "NEW" },
        { type: "hot", text: "인기" }
        ],
        rating: "9.2",
        genre: "액션/드라마",
        duration: "120분",
        releaseDate: "2025.05.15 개봉",
        description: "폭력 서클의 괴롭힘으로부터 홀로 맞서 싸우는 약한 체구의 모범생 연시은. 그는 자신만의 방식으로 학교 폭력에 맞서며 진정한 영웅이 되어간다. 새로운 시즌에서는 더 강력한 적과 마주하게 된다.",
        videoSrc: "./videos/약한영웅2.mp4",
        imageSrc: "https://image.tmdb.org/t/p/w500/kQO9BGj2CnLEuT7Xw6eCbV6q2NN.jpg"
    },
    {
        id: 2,
        title: "미스터 로봇",
        badges: [
        { type: "hot", text: "인기" }
        ],
        rating: "8.7",
        genre: "액션/SF",
        duration: "135분",
        releaseDate: "2025.04.10 개봉",
        description: "최악의 빌런들이 모여 세상을 구하는 임무를 맡게 된다. 그들은 서로 믿지 못하고 갈등하지만, 더 큰 위협 앞에서 어쩔 수 없이 협력해야만 한다.",
        videoSrc: "./videos/thunderbolts.mp4",
        imageSrc: "https://m.media-amazon.com/images/M/MV5BNzVjOWEwYjEtNDJhOC00YjUyLThjMWItMDQwZGY1ODM4YzI3XkEyXkFqcGc@._V1_SX300.jpg"
    },
    {
        id: 3,
        title: "200% WOlF",
        badges: [
        { type: "new", text: "NEW" }
        ],
        rating: "9.5",
        genre: "뮤지컬/드라마",
        duration: "150분",
        releaseDate: "2025.05.01 개봉",
        description: "빅토르 위고의 고전 소설을 각색한 뮤지컬. 기이한 웃음을 가진 그윈플렌과 그의 아름다운 사랑 이야기가 감동적인 음악과 함께 펼쳐진다.",
        videoSrc: "./videos/weak_hero.mp4",
        imageSrc: "https://cdn.mhnse.com/news/photo/202204/102107_85132_5822.jpg"
    },
    {
        id: 4,
        title: "FIRE FIGHTERS",
        badges: [
        { type: "new", text: "NEW" }
        ],
        rating: "9.5",
        genre: "뮤지컬/드라마",
        duration: "150분",
        releaseDate: "2025.05.01 개봉",
        description: "빅토르 위고의 고전 소설을 각색한 뮤지컬. 기이한 웃음을 가진 그윈플렌과 그의 아름다운 사랑 이야기가 감동적인 음악과 함께 펼쳐진다.",
        videoSrc: "./videos/weak_hero.mp4",
        imageSrc: "https://image.tmdb.org/t/p/w500/8claugsQFr5SAx4K2anZPJuPRqL.jpg"
    },
    {
        id: 5,
        title: "퇴마록",
        badges: [
        { type: "new", text: "NEW" }
        ],
        rating: "9.5",
        genre: "뮤지컬/드라마",
        duration: "150분",
        releaseDate: "2025.05.01 개봉",
        description: "빅토르 위고의 고전 소설을 각색한 뮤지컬. 기이한 웃음을 가진 그윈플렌과 그의 아름다운 사랑 이야기가 감동적인 음악과 함께 펼쳐진다.",
        videoSrc: "./videos/weak_hero.mp4",
        imageSrc: "https://image.tmdb.org/t/p/w500/hrj2n8sRtR8Me9J7C6bmEkYAS3B.jpg"
    }
    // 필요한 만큼 데이터를 추가 가능
    ];