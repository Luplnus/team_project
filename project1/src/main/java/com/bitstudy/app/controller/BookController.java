package com.bitstudy.app.controller;

import com.bitstudy.app.dao.*;
import com.bitstudy.app.domain.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.*;

@Controller
public class BookController {
    @Autowired
    MovieDao movieDao;
    @Autowired
    MusicalDao musicalDao;
    @Autowired
    TheaterDao theaterDao;
    @Autowired
    Book_movieDao book_movieDao;
    @Autowired
    Book_musicalDao book_musicalDao;
    @Autowired
    Book_theaterDao book_theaterDao;
    @Autowired
    Seat_movieDao seat_movieDao;
    @Autowired
    Seat_musicalDao seat_musicalDao;
    @Autowired
    Seat_theaterDao seat_theaterDao;
    @Autowired
    UserDao userDao;

    @ResponseBody
    @PostMapping("/payment/movie") // 받은 content_id로 movieDto 하나 select
    public ResponseEntity<String> payment_movie(@RequestBody Map<String, String> data, HttpSession session) {
        MovieDto movieDto = movieDao.selectOneMovie(data.get("content_id"));
        // session에 movieDto, 상영 시간, 극장, 좌석번호 담음
        session.setAttribute("movieDto", movieDto);
        session.setAttribute("time", data.get("time"));
        session.setAttribute("venue", data.get("venue"));
        session.setAttribute("s_label", data.get("s_label"));
        return new ResponseEntity<>("success", HttpStatus.OK);
    }
    @ResponseBody
    @PostMapping("/payment/musical")
    public ResponseEntity<String> payment_musical(@RequestBody Map<String, String> data, HttpSession session) {
        MusicalDto musicalDto = musicalDao.select(data.get("content_id"));

        session.setAttribute("musicalDto", musicalDto);
        session.setAttribute("time", data.get("time"));
        session.setAttribute("venue", data.get("venue"));
        session.setAttribute("s_label", data.get("s_label"));
        return new ResponseEntity<>("success", HttpStatus.OK);
    }
    @ResponseBody
    @PostMapping("/payment/theater")
    public ResponseEntity<String> payment_theater(@RequestBody Map<String, String> data, HttpSession session) {
        TheaterDto theaterDto = theaterDao.selectOneMovie(data.get("content_id"));

        session.setAttribute("theaterDto", theaterDto);
        session.setAttribute("time", data.get("time"));
        session.setAttribute("venue", data.get("venue"));
        session.setAttribute("s_label", data.get("s_label"));
        return new ResponseEntity<>("success", HttpStatus.OK);
    }

    @GetMapping("/payment/data/movie") // Axios(payment_movie)에서 여기로 요청
    @ResponseBody
    public Map<String, Object> getPaymentData_movie(HttpSession session) {
        if(session.getAttribute("movieDto") != null) { // 영화 예매이면
//            session.removeAttribute("musicalDto"); // 뮤지컬 dto 세션 종료
//            session.removeAttribute("theaterDto"); // 연극 dto 세션 종료
            
            Map<String, Object> result = new HashMap<>();
            result.put("movieDto", session.getAttribute("movieDto"));
            result.put("time", session.getAttribute("time"));
            result.put("venue", session.getAttribute("venue"));
            result.put("s_label", session.getAttribute("s_label"));
            return result;
        }
        else {
            return null;
        }
    }
    @GetMapping("/payment/data/musical")
    @ResponseBody
    public Map<String, Object> getPaymentData_musical(HttpSession session) {
        if(session.getAttribute("musicalDto") != null) {
//            session.removeAttribute("movieDto");
//            session.removeAttribute("theaterDto");

            Map<String, Object> result = new HashMap<>();
            result.put("musicalDto", session.getAttribute("musicalDto"));
            result.put("time", session.getAttribute("time"));
            result.put("venue", session.getAttribute("venue"));
            result.put("s_label", session.getAttribute("s_label"));
            return result;
        }
        else {
            return null;
        }

    }
    @GetMapping("/payment/data/theater")
    @ResponseBody
    public Map<String, Object> getPaymentData_theater(HttpSession session) {
        if(session.getAttribute("theaterDto") != null) {
//            session.removeAttribute("movieDto");
//            session.removeAttribute("musicalDto");

            Map<String, Object> result = new HashMap<>();
            result.put("theaterDto", session.getAttribute("theaterDto"));
            result.put("time", session.getAttribute("time"));
            result.put("venue", session.getAttribute("venue"));
            result.put("s_label", session.getAttribute("s_label"));
            return result;
        }
        else {
            return null;
        }
    }

//    /////////////////////////////////////////////////////////////////////////////////////////////


    @PostMapping("/book/movie") // 영화 예매 > ajax로 Book_movieDto 받아서 m_movie_cd 받아옴 book_movie_tbl에 저장
    @ResponseBody
    public ResponseEntity<String> addBook_movie(@RequestBody Map<String, Object> map, HttpSession session) {
        UserDto userDto = userDao.selectUser( (String)session.getAttribute("u_id")); // 세션에서 u_id 받아서 해당 userDto 저장
        Integer b_user_seqno = userDto.getU_seqno(); // 해당 u_id의 user_seqno 받아와서

        ObjectMapper mapper = new ObjectMapper(); // Json을 객체로 변환
        Book_movieDto book_movieDto = mapper.convertValue(map, Book_movieDto.class); // @RequestBody로 받은 JSON데이터 map을 Book_movieDto클래스로 리턴 - book_movieDto 변수로 저장
        book_movieDto.setB_user_seqno(b_user_seqno); // book_movieDto에 b_user_seqno set

        String m_movie_cd = book_movieDto.getM_movie_cd(); // 받아온 m_movie_cd와
        String s_label = (String) map.get("s_label"); // 받아온 s_label로
        Integer s_id = seat_movieDao.select_s_id(m_movie_cd, s_label); // 해당 s_id 구해서
        book_movieDto.setS_id(s_id); // book_musicalDto에 s_id set

        try {
            int rowCount = book_movieDao.insert(book_movieDto); // insert가 성공하면 rowCount == 1
            if (rowCount == 0) { // insert 실패
                return new ResponseEntity<String>("BOOK_FAIL", HttpStatus.OK);
            } else { // insert 성공하면
                seat_movieDao.update_false(s_id); // s_is_available false로 업데이트
                return new ResponseEntity<String>("BOOK_OK", HttpStatus.OK);
            }
        }
        catch (Exception e) { //
            e.printStackTrace();
            return new ResponseEntity<String>("BOOK_ERROR", HttpStatus.BAD_REQUEST);
        }
    }

// 뮤지컬 예매 > b_user_seqno은 세션으로, mu_id, b_musical_time은 ajax로, b_time, b_price는 생성될때 자동으로 받아서 book_musical_tbl에 INSERT
// m_code, s_label로 s_is_avaliable false로 UPDATE, m_code, s_label로 s_id 받아서 insert??
// 극장 이름(vm_name) 받아서 해당 venue_movie_tbl에 vm_b_seqno update?
    @PostMapping("/book/musical") // 뮤지컬 예매 > ajax로 Book_musicalDto 받아서 m_code 받아옴 book_musical_tbl에 저장
    @ResponseBody
    public ResponseEntity<String> addBook_musical(@RequestBody Map<String, Object> map, HttpSession session) {
        UserDto userDto = userDao.selectUser( (String)session.getAttribute("u_id")); // 세션에서 u_id 받아서 해당 userDto 저장
        Integer b_user_seqno = userDto.getU_seqno(); // 해당 u_id의 user_seqno 받아와서

        ObjectMapper mapper = new ObjectMapper(); // Json을 객체로 변환
        Book_musicalDto book_musicalDto = mapper.convertValue(map, Book_musicalDto.class); // @RequestBody로 받은 JSON데이터 map을 Book_muscialDto클래스로 리턴 - book_musicalDto 변수로 저장
        book_musicalDto.setB_user_seqno(b_user_seqno); // book_musicalDto에 b_user_seqno set

        String mu_id = book_musicalDto.getMu_id(); // 받아온 mu_id와
        String s_label = (String) map.get("s_label"); // 받아온 s_label로
        Integer s_id = seat_musicalDao.select_s_id(mu_id, s_label); // 해당 s_id 구해서
        book_musicalDto.setS_id(s_id); // book_musicalDto에 s_id set

        try {
            int rowCount = book_musicalDao.insert(book_musicalDto); // insert가 성공하면 rowCount == 1
            if (rowCount == 0) { // insert 실패
                return new ResponseEntity<String>("BOOK_FAIL", HttpStatus.OK);
            } else { // insert 성공
                seat_musicalDao.update_false(s_id); // s_is_available false로 업데이트
                return new ResponseEntity<String>("BOOK_OK", HttpStatus.OK);
            }
        }
        catch (Exception e) { //
            e.printStackTrace();
            return new ResponseEntity<String>("BOOK_ERROR", HttpStatus.BAD_REQUEST);
        }
    }

    @PostMapping("/book/theater") // 연극 예매 > ajax로 Book_musicalDto 받아서 m_code, s_id 받아옴 book_musical_tbl에 저장
    @ResponseBody
    public ResponseEntity<String> addBook_theater(@RequestBody Map<String, Object> map, HttpSession session) {
        UserDto userDto = userDao.selectUser( (String)session.getAttribute("u_id")); // 세션에서 u_id 받아서 해당 userDto 저장
        Integer b_user_seqno = userDto.getU_seqno(); // 해당 user_seqno 받아와서

        ObjectMapper mapper = new ObjectMapper(); // Json을 객체로 변환
        Book_theaterDto book_theaterDto = mapper.convertValue(map, Book_theaterDto.class); // @RequestBody로 받은 JSON데이터 map을 Book_muscialDto클래스로 리턴 - book_theaterDto 변수로 저장
        book_theaterDto.setB_user_seqno(b_user_seqno); // book_theaterDto에 b_user_seqno set

        String t_id = book_theaterDto.getT_id(); // 받아온 t_id와
        String s_label = (String) map.get("s_label"); // 받아온 s_label로
        Integer s_id = seat_theaterDao.select_s_id(t_id, s_label); // 해당 s_id 구해서
        book_theaterDto.setS_id(s_id); // book_theaterDto에 s_id set

        try {
            int rowCount = book_theaterDao.insert(book_theaterDto); // insert가 성공하면 rowCount == 1
            if (rowCount == 0) { // insert 실패
                return new ResponseEntity<String>("BOOK_FAIL", HttpStatus.OK);
            } else { // insert 성공
                seat_theaterDao.update_false(s_id); // s_is_available false로 업데이트
                return new ResponseEntity<String>("BOOK_OK", HttpStatus.OK);
            }
        }
        catch (Exception e) { //
            e.printStackTrace();
            return new ResponseEntity<String>("BOOK_ERROR", HttpStatus.BAD_REQUEST);
        }
    }


    private boolean isLogin(HttpServletRequest request){
        HttpSession session = request.getSession();

        return session.getAttribute("u_id") != null;
    }
}
