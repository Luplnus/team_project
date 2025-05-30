package com.bitstudy.app.controller;

import com.bitstudy.app.dao.Seat_musicalDao;
import com.bitstudy.app.dao.TheaterDao;
import com.bitstudy.app.dao.UserDao;
import com.bitstudy.app.domain.*;
import com.bitstudy.app.service.Book_movieService;
import com.bitstudy.app.service.Book_musicalService;
import com.bitstudy.app.service.Book_theaterService;
import com.bitstudy.app.service.MusicalService;
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
import java.util.List;
import java.util.Map;

@Controller
public class BookController {
    @Autowired
    MusicalService musicalService;
    @Autowired
    Book_movieService book_movieService;
    @Autowired
    Book_musicalService book_musicalService;
    @Autowired
    Book_theaterService book_theaterService;
    @Autowired
    UserDao userDao;
    @Autowired
    TheaterDao theaterDao;
    @Autowired
    Seat_musicalDao seat_musicalDao;

    @GetMapping("/book") // 그냥 들어옴 - movie, musical, theater 리스트 띄워주고 선택한 컨텐츠는 없음
    public String book(HttpServletRequest request, Model model) {
        if(!isLogin(request)) {
            HttpSession session = request.getSession();
            session.setAttribute("toUrl", request.getServletPath());
            session.setAttribute("query", request.getQueryString());
            return "redirect:/logIn";
        }

//        List<MusicalDto> movieList = movieService.selectAll(); // 영화 전부 불러옴
//        model.addAttribute("movieList", movieList);
        List<MusicalDto> musicalList = musicalService.selectAll(); // 뮤지컬 전부 불러옴
        model.addAttribute("musicalList", musicalList);
        List<TheaterDto> theaterList = theaterDao.selectAll(); // 연극 전부 불러옴
        model.addAttribute("theaterList", theaterList);

        return "ticketing_page";
    }

//    @PostMapping("/book") // 그냥 예매 > ajax로 post - /book/해당장르

//    @GetMapping("/book/movie") // 영화 상세 페이지에서 m_id받아서 예매하기로 들어옴
//    public String book_movie(@RequestParam(value = "code", required = false) String m_id, HttpServletRequest request, Model model) {
//        if(!isLogin(request)) {
//            HttpSession session = request.getSession();
//            session.setAttribute("toUrl", request.getServletPath());
//            session.setAttribute("query", request.getQueryString());
//            return "redirect:/logIn";
//        }
//        if(m_id == null || "".equals(m_id)) { // m_id가 없으면 (상세 페이지에서 들어온게 아니면)
//            return "redirect:/book";
//        }
//        else{
//            List<MovieDto> movieList = movieService.selectAll(); // 영화 전부 불러옴
//            model.addAttribute("movieList", movieList); // movieList view로 전달
//            MovieDto movieDto = movieService.select(m_id); // 받아온 mu_id로 해당 movieDto 불러옴
//            model.addAttribute("movieDto", movieDto); // model에 movieDto 담아서 view로 보냄
//            // view에서 해당 뮤지컬 선택되게
//            //        List<MusicalDto> movieList = movieService.selectAll(); //
//            //        model.addAttribute("movieList", movieList); //
//            //        List<TheaterDto> theaterList = theaterDao.selectAll(); //
//            //        model.addAttribute("theaterList", theaterList); //
//            return "book";
//        }
//    }

//    @PostMapping("/book/movie") // 영화 예매 > ajax로 Book_movieDto 받아서 m_code, s_id 받아옴 book_movie_tbl에 저장
//    @ResponseBody
//    public ResponseEntity<String> addBook_movie(@RequestBody Book_movieDto book_movieDto, HttpSession session) {
//        UserDto userDto = userDao.selectUser( (String)session.getAttribute("u_id")); // 세션에서 u_id 받아서 해당 userDto 저장
//        Integer b_user_seqno = userDto.getU_seqno(); // 해당 u_id의 user_seqno 받아와서
//        book_movieDto.setB_user_seqno(b_user_seqno); // book_movieDto에 set
//
//        try {
//            int rowCount = book_movieService.insert(book_movieDto); // insert가 성공하면 rowCount == 1
//            if (rowCount == 0) { // insert 실패
//                return new ResponseEntity<String>("BOOK_FAIL", HttpStatus.OK);
//            } else { // insert 성공
//                return new ResponseEntity<String>("BOOK_OK", HttpStatus.OK);
//
//            }
//        }
//        catch (Exception e) { //
//            e.printStackTrace();
//            return new ResponseEntity<String>("BOOK_ERROR", HttpStatus.BAD_REQUEST);
//        }
//    }

    @GetMapping("/book/musical") // 뮤지컬 상세 페이지에서 mu_id받아서 예매하기로 들어옴
    public String book_musical(@RequestParam(value = "code", required = false) String mu_id, HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();

        if(!isLogin(request)) {
            session.setAttribute("toUrl", request.getServletPath());
            session.setAttribute("query", request.getQueryString());
            return "redirect:/logIn";
        }
        if(mu_id == null || "".equals(mu_id)) { // mu_id가 없으면 (상세 페이지에서 들어온게 아니면)
            return "redirect:/ticketing_page";
        }
        else{

            List<MusicalDto> musicalList = musicalService.selectAll(); // 뮤지컬 전부 불러옴
            model.addAttribute("musicalList", musicalList); // musicalList view로 전달
            MusicalDto musicalDto = musicalService.select(mu_id); // 받아온 mu_id로 해당 musicalDto 불러옴
            model.addAttribute("musicalDto", musicalDto); // model에 musicalDto 담아서 view로 보냄
                                                            // view에서 해당 뮤지컬 선택되게
            //        List<MusicalDto> movieList = movieService.selectAll(); //  
            //        model.addAttribute("movieList", movieList); //
            //        List<TheaterDto> theaterList = theaterDao.selectAll(); //
            //        model.addAttribute("theaterList", theaterList); //
            return "ticketing_page";
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

        // vm_name 은 ?
        try {
            int rowCount = book_musicalService.insert(book_musicalDto); // insert가 성공하면 rowCount == 1
            if (rowCount == 0) { // insert 실패
                return new ResponseEntity<String>("BOOK_FAIL", HttpStatus.OK);
            } else { // insert 성공

                return new ResponseEntity<String>("BOOK_OK", HttpStatus.OK);
            }
        }
        catch (Exception e) { //
            e.printStackTrace();
            return new ResponseEntity<String>("BOOK_ERROR", HttpStatus.BAD_REQUEST);
        }
    }

    @GetMapping("/book/theater") // 연극 상세 페이지에서 t_id받아서 예매하기로 들어옴
    public String book_theater(@RequestParam(value = "code", required = false) String t_id, HttpServletRequest request, Model model) {
        if(!isLogin(request)) {
            HttpSession session = request.getSession();
            session.setAttribute("toUrl", request.getServletPath());
            session.setAttribute("query", request.getQueryString());
            return "redirect:/logIn";
        }
        if(t_id == null || "".equals(t_id)) { // t_id가 없으면 (상세 페이지에서 들어온게 아니면)
            return "redirect:/ticketing_page";
        }
        else{
            List<TheaterDto> theaterList = theaterDao.selectAll(); // 연극 전부 불러옴
            model.addAttribute("theaterList", theaterList); // theaterList view로 전달
            TheaterDto theaterDto = theaterDao.selectOneMovie(t_id); // 받아온 t_id로 theaterDto 하나 불러옴
            model.addAttribute("theaterDto", theaterDto); // model에 theaterDto 담아서 view로 보냄
                                                            //  view에서 해당 뮤지컬 선택되게
            //        List<MusicalDto> movieList = movieService.selectAll(); //
            //        model.addAttribute("movieList", movieList); //
            //        List<MusicalDto> musicalList = musicalDao.selectAll(); //
            //        model.addAttribute("musicalList", musicalList); //
            return "ticketing_page";
        }
    }

    @PostMapping("/book/theater") // 연극 예매 > ajax로 Book_musicalDto 받아서 m_code, s_id 받아옴 book_musical_tbl에 저장
    @ResponseBody
    public ResponseEntity<String> addBook_theater(@RequestBody Book_theaterDto book_theaterDto, HttpSession session) {
        UserDto userDto = userDao.selectUser( (String)session.getAttribute("u_id")); // 세션에서 u_id 받아서 해당 userDto 저장
        Integer b_user_seqno = userDto.getU_seqno(); // 해당 user_seqno 받아와서
        book_theaterDto.setB_user_seqno(b_user_seqno); // book_theaterDto에 set

        try {
            int rowCount = book_theaterService.insert(book_theaterDto); // insert가 성공하면 rowCount == 1
            if (rowCount == 0) { // insert 실패
                return new ResponseEntity<String>("BOOK_FAIL", HttpStatus.OK);
            } else { // insert 성공
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
