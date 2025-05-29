//package com.bitstudy.app.dao;
//
//import com.bitstudy.app.domain.BookDto;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//
//import java.util.List;
//
//import static org.junit.Assert.assertTrue;
//
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
//public class BookDaoTest {
//
//    @Autowired
//    private BookDao bookDao;
//
//    @Test
//    public void count() {
//        assertTrue(bookDao.count() == 1);
//    }
//
//    @Test
//    public void insert() {
//        bookDao.deleteAll();
//
//        BookDto bookDto = new BookDto("유저아이디", "b_장르","b_코드넘버", "b_홀", "b_시간");
//        assertTrue(bookDao.insert(bookDto) == 1);
//
//        bookDto = new BookDto("유저아이디2", "b_장르2","b_코드넘버2", "b_홀2", "b_시간2");
//        assertTrue(bookDao.insert(bookDto) == 1);
//        assertTrue(bookDao.count() == 2);
//    }
//
//    @Test
//    public void deleteAll() {
//        bookDao.deleteAll();
//        assertTrue(bookDao.count() == 0);
//    }
//
//    @Test
//    public void delete() {
//        bookDao.deleteAll();
//
//        BookDto bookDto = new BookDto("유저아이디", "b_장르","b_코드넘버", "b_홀", "b_시간");
//        bookDao.insert(bookDto);
//
//        assertTrue(bookDao.delete(1, "유저아이디") == 1);
//    }
//
//    public void insertTest() {
//        deleteAll();
//        for (int i = 1; i <= 100; i++) {
//            BookDto bookDto = new BookDto("유저아이디"+i, "movie","b_코드넘버"+i, "b_홀"+i, "b_시간"+i);
//            bookDao.insert(bookDto);
//        }
//        for (int i = 101; i <= 130; i++) {
//            BookDto bookDto = new BookDto("유저아이디"+i, "musical","b_코드넘버"+i, "b_홀"+i, "b_시간"+i);
//            bookDao.insert(bookDto);
//        }
//        for (int i = 131; i <= 180; i++) {
//            BookDto bookDto = new BookDto("유저아이디"+i, "theater","b_코드넘버"+i, "b_홀"+i, "b_시간"+i);
//            bookDao.insert(bookDto);
//        }
//        assertTrue(bookDao.count() == 180);
//    }
//
//    @Test
//    public void selectAll_newest() {
//        insertTest();
//
//        List<BookDto> list = bookDao.selectAll_newest();
//
//        for(BookDto bookDto:list){
//            System.out.println("list: " + bookDto);
//        }
//
//        assertTrue(bookDao.selectAll_newest().size() == 300);
//    }
//
//    @Test
//    public void selectAll_oldest() {
//        insertTest();
//
//        List<BookDto> list = bookDao.selectAll_oldest();
//
//        for(BookDto bookDto:list){
//            System.out.println("list: " + bookDto);
//        }
//
//        assertTrue(bookDao.selectAll_oldest().size() == 300);
//    }
//
//    public void selecttest(){
//        deleteAll();
//
//        for (int i = 1; i <= 100; i++) {
//            BookDto bookDto = new BookDto("유저아이디"+i, "movie","b_코드넘버"+i, "b_홀"+i, "b_시간"+i);
//            bookDto.setB_price(String.valueOf(i));
//            bookDao.insert(bookDto);
//        }
//    }
//
//    @Test
//    public void selectAll_price() {
//        selecttest();
//
//        List<BookDto> list = bookDao.selectAll_price();
//
//        for(BookDto bookDto:list){
//            System.out.println("list: " + bookDto);
//        }
//
//        assertTrue(bookDao.selectAll_price().size() == 100);
//    }
//
//    @Test
//    public void select_movie() {
//        insertTest();
//
//        List<BookDto> list = bookDao.select_movie();
//
//        for(BookDto bookDto:list){
//            System.out.println("list: " + bookDto);
//        }
//
//        assertTrue(bookDao.select_movie().size() == 100);
//    }
//
//    @Test
//    public void select_musical() {
//        insertTest();
//
//        List<BookDto> list = bookDao.select_musical();
//
//        for(BookDto bookDto:list){
//            System.out.println("list: " + bookDto);
//        }
//
//        assertTrue(bookDao.select_musical().size() == 30);
//    }
//
//    @Test
//    public void select_theater() {
//        insertTest();
//
//        List<BookDto> list = bookDao.select_theater();
//
//        for(BookDto bookDto:list){
//            System.out.println("list: " + bookDto);
//        }
//
//        assertTrue(bookDao.select_theater().size() == 50);
//    }
//
//    @Test
//    public void select() {
//        deleteAll(); // 싹 다 지우고
//        BookDto bookDto = new BookDto("유저아이디", "b_장르","b_코드넘버", "b_홀", "b_시간");
//        bookDao.insert(bookDto); // DB에 넣고
//
//        // DB상 맨 위에 있는 정보(어짜피 한개밖에 없으니깐)에서 글번호 가져오기
//        Integer b_seqno = bookDao.selectAll_newest().get(0).getB_seqno();
////        assertTrue(b_seqno == 1);
//
//        bookDto.setB_seqno(b_seqno);
//
//        // 위에서 구한 bno 를 이용해서 해당 글 한줄만 불러오기
//        BookDto bookDto2 = bookDao.select(b_seqno);
//
//        System.out.println(bookDto);
//        System.out.println(bookDto2);
//
//        assertTrue(bookDto.getB_seqno().equals(bookDto2.getB_seqno()));
//    }
//}