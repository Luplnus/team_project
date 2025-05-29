package com.bitstudy.app;

import java.util.Date;

/**
    1) pom.xml 파일 설정
        - mvn repo 에서 mybatis 검색 >
        - 'MyBatis' 랑 'MyBatis Spring(2.X.X버전)' pom 에 넣고 
        - pom 업데이트하기
        
    2) web.xml 파일 한글 필터 설정 (이거 없으면 게시판에서 한글이 이상하게 나옴)

    3) root-context.xml 파일 설정 (아래 두개 xml 파일에 넣기. - 미리 넣어놨음)
        <bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
        <bean id="sqlSession" class="org.mybatis.spring.SqlSessionTemplate">

    4) mybatis-config.xml 생성
        - main > resources > mybatis-config.xml 만들기 (나중에 별칭 정할거임)
        - main > resources > mapper 폴더 만들고 > *Mapper.xml 만들기 (모든 sql 문들 다 넣을거임)
 
    5) servlet-context.xml 설정
        - <view-controller path="/" view-name="index"/> (이거 있으면 homeController 없어도 / 들어오면 index.jsp 파일 보여줌)
          (HomeController.java 파일 지우면 됨. 이거 살아있으면 그 폴더꺼랑 연결된 뷰 파일이 브라우저에 뜸)

 ----------------------------------------------------------------------------------------------------

    1) 각 view 파일들 영어 이름으로 변경 (index, loginForm, registerForm, board)
    2) css 들 다 복사해오기
    3) 자바 영역에 'controller', 'dao', 'domain(dto라고 해도 됨)' 패키지 생성
    4) controller 패키지에 LoginController 만들기

 -------------------------------------------------------------------------------------------------
 create table board (
     bno int unsigned auto_increment primary key,
     title varchar(50) not null,
     content text not null,
     writer varchar(50) not null,
     view_count int default 0 null,
     comment_count int default 0 null,
     reg_date datetime default CURRENT_TIMESTAMP null,
     up_date datetime default CURRENT_TIMESTAMP null
 );

 create table comment (
     cno int unsigned auto_increment not null primary key,
     bno int unsigned not null,
     comment text not null,
     commenter varchar(50) not null,
     reg_date datetime default current_timestamp null,
     up_date  datetime default current_timestamp null
 );
 */

public class Ex00_설정하기 {
    public static void main(String[] args) {

    }
}







