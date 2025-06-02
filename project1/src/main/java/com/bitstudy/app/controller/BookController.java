package com.bitstudy.app.controller;

import com.bitstudy.app.dao.Seat_musicalDao;
import com.bitstudy.app.dao.TheaterDao;
import com.bitstudy.app.dao.UserDao;
import com.bitstudy.app.domain.*;
import com.bitstudy.app.service.*;
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
    MovieService movieService;
    @Autowired
    MusicalService musicalService;
    @Autowired
    TheaterDao theaterDao;
    @Autowired
    Book_movieService book_movieService;
    @Autowired
    Book_musicalService book_musicalService;
    @Autowired
    Book_theaterService book_theaterService;
    @Autowired
    Seat_movieService seat_movieService;
    @Autowired
    Seat_musicalService seat_musicalService;
    @Autowired
    Seat_theaterService seat_theaterService;
    @Autowired
    UserDao userDao;

    @ResponseBody
    @PostMapping("/payment/movie") // 받은 content_id로 movieDto 하나 select
    public ResponseEntity<String> payment_movie(@RequestBody Map<String, String> data, HttpSession session) {
        MovieDto movieDto = movieService.selectOneMovie(data.get("content_id"));
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
        MusicalDto musicalDto = musicalService.select(data.get("content_id"));

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
            session.removeAttribute("musicalDto"); // 뮤지컬 dto 세션 종료
            session.removeAttribute("theaterDto"); // 연극 dto 세션 종료
            
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
            session.removeAttribute("movieDto");
            session.removeAttribute("theaterDto");

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
            session.removeAttribute("movieDto");
            session.removeAttribute("musicalDto");

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

    @GetMapping("/book") // 그냥 들어옴 - movie, musical, theater 리스트 띄워주고 선택한 컨텐츠는 없음
    public String book(HttpServletRequest request, Model model) {
        if(!isLogin(request)) {
            HttpSession session = request.getSession();
            session.setAttribute("toUrl", request.getServletPath());
            session.setAttribute("query", request.getQueryString());
            return "redirect:/logIn";
        }

        List<MovieDto> movieList = movieService.selectAll(); // 영화 전부 불러옴
        model.addAttribute("movieList", movieList);
        List<MusicalDto> musicalList = musicalService.selectAll(); // 뮤지컬 전부 불러옴
        model.addAttribute("musicalList", musicalList);
        List<TheaterDto> theaterList = theaterDao.selectAll(); // 연극 전부 불러옴
        model.addAttribute("theaterList", theaterList);

        List<Map<String, String>> s_is_available_movie = seat_movieService.select_false(); //seat_movie에서 s_is_available = false인 것만 불러옴
        List<Map<String, String>> s_is_available_musical = seat_musicalService.select_false(); //seat_musical에서 s_is_available = false인 것만 불러옴
        List<Map<String, String>> s_is_available_theater = seat_theaterService.select_false(); //seat_theater에서 s_is_available = false인 것만 불러옴
        model.addAttribute("s_is_available_movie", s_is_available_movie); // model에 넣음
        model.addAttribute("s_is_available_musical", s_is_available_musical); // model에 넣음
        model.addAttribute("s_is_available_theater", s_is_available_theater); // model에 넣음

        return "ticketing_page";
    }

    @GetMapping("/book/movie") // 영화 상세 페이지에서 m_movie_cd받아서 예매하기로 들어옴
    public String book_movie(@RequestParam(value = "code", required = false) String m_movie_cd, HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        // 로그인 체크
        if(!isLogin(request)) {
            session.setAttribute("toUrl", request.getServletPath());
            session.setAttribute("query", request.getQueryString());
            return "redirect:/logIn";
        }
        // m_movie_cd가 없으면 (상세 페이지에서 들어온게 아니면)
        if(m_movie_cd == null || "".equals(m_movie_cd)) {
            return "redirect:/book";
        }
        // 상세페이지에서 들어오면
        else{
            List<MovieDto> movieList = movieService.selectAll(); // 영화 전부 불러옴
            model.addAttribute("movieList", movieList); // movieList view로 전달
            MovieDto movieDto = movieService.selectOneMovie(m_movie_cd); // 받아온 m_movie_cd로 해당 movieDto 불러옴
            model.addAttribute("movieDto", movieDto); // model에 movieDto 담아서 view로 보냄
            List<TheaterDto> theaterList = theaterDao.selectAll(); // 연극 전부 불러옴
            model.addAttribute("theaterList", theaterList); // theaterList view로 전달
            List<MusicalDto> musicalList = musicalService.selectAll(); // 뮤지컬 전부 불러옴
            model.addAttribute("musicalList", musicalList); // musicalList view로 전달
            
            List<Map<String, String>> s_is_available_movie = seat_movieService.select_false(); //seat_movie에서 s_is_available = false인 것만 불러옴
            List<Map<String, String>> s_is_available_musical = seat_musicalService.select_false(); //seat_musical에서 s_is_available = false인 것만 불러옴
            List<Map<String, String>> s_is_available_theater = seat_theaterService.select_false(); //seat_theater에서 s_is_available = false인 것만 불러옴
            model.addAttribute("s_is_available_movie", s_is_available_movie); // model에 넣음
            model.addAttribute("s_is_available_musical", s_is_available_musical); // model에 넣음
            model.addAttribute("s_is_available_theater", s_is_available_theater); // model에 넣음

            return "ticketing_page";
        }
    }

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
        Integer s_id = seat_movieService.select_s_id(m_movie_cd, s_label); // 해당 s_id 구해서
        book_movieDto.setS_id(s_id); // book_musicalDto에 s_id set

        try {
            int rowCount = book_movieService.insert(book_movieDto); // insert가 성공하면 rowCount == 1
            if (rowCount == 0) { // insert 실패
                return new ResponseEntity<String>("BOOK_FAIL", HttpStatus.OK);
            } else { // insert 성공하면
                seat_movieService.update_false(s_id); // s_is_available false로 업데이트
                return new ResponseEntity<String>("BOOK_OK", HttpStatus.OK);
            }
        }
        catch (Exception e) { //
            e.printStackTrace();
            return new ResponseEntity<String>("BOOK_ERROR", HttpStatus.BAD_REQUEST);
        }
    }

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
            List<TheaterDto> theaterList = theaterDao.selectAll(); //
            model.addAttribute("theaterList", theaterList); //
            List<MovieDto> movieList = movieService.selectAll(); //
            model.addAttribute("movieList", movieList); //

            List<Map<String, String>> s_is_available_movie = seat_movieService.select_false(); //seat_movie에서 s_is_available = false인 것만 불러옴
            List<Map<String, String>> s_is_available_musical = seat_musicalService.select_false(); //seat_musical에서 s_is_available = false인 것만 불러옴
            List<Map<String, String>> s_is_available_theater = seat_theaterService.select_false(); //seat_theater에서 s_is_available = false인 것만 불러옴
            model.addAttribute("s_is_available_movie", s_is_available_movie); // model에 넣음
            model.addAttribute("s_is_available_musical", s_is_available_musical); // model에 넣음
            model.addAttribute("s_is_available_theater", s_is_available_theater); // model에 넣음
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
        Integer s_id = seat_musicalService.select_s_id(mu_id, s_label); // 해당 s_id 구해서
        book_musicalDto.setS_id(s_id); // book_musicalDto에 s_id set

        try {
            int rowCount = book_musicalService.insert(book_musicalDto); // insert가 성공하면 rowCount == 1
            if (rowCount == 0) { // insert 실패
                return new ResponseEntity<String>("BOOK_FAIL", HttpStatus.OK);
            } else { // insert 성공
                seat_musicalService.update_false(s_id); // s_is_available false로 업데이트
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
            return "redirect:/book";
        }
        else{
            List<TheaterDto> theaterList = theaterDao.selectAll(); // 연극 전부 불러옴
            model.addAttribute("theaterList", theaterList); // theaterList view로 전달
            TheaterDto theaterDto = theaterDao.selectOneMovie(t_id); // 받아온 t_id로 theaterDto 하나 불러옴
            model.addAttribute("theaterDto", theaterDto); // model에 theaterDto 담아서 view로 보냄
                                                            //  view에서 해당 뮤지컬 선택되게
            List<MovieDto> movieList = movieService.selectAll(); //
            model.addAttribute("movieList", movieList); //
            List<MusicalDto> musicalList = musicalService.selectAll(); //
            model.addAttribute("musicalList", musicalList); //

            List<Map<String, String>> s_is_available_movie = seat_movieService.select_false(); //seat_movie에서 s_is_available = false인 것만 불러옴
            List<Map<String, String>> s_is_available_musical = seat_musicalService.select_false(); //seat_musical에서 s_is_available = false인 것만 불러옴
            List<Map<String, String>> s_is_available_theater = seat_theaterService.select_false(); //seat_theater에서 s_is_available = false인 것만 불러옴
            model.addAttribute("s_is_available_movie", s_is_available_movie); // model에 넣음
            model.addAttribute("s_is_available_musical", s_is_available_musical); // model에 넣음
            model.addAttribute("s_is_available_theater", s_is_available_theater); // model에 넣음
            return "ticketing_page";
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
        Integer s_id = seat_theaterService.select_s_id(t_id, s_label); // 해당 s_id 구해서
        book_theaterDto.setS_id(s_id); // book_theaterDto에 s_id set

        try {
            int rowCount = book_theaterService.insert(book_theaterDto); // insert가 성공하면 rowCount == 1
            if (rowCount == 0) { // insert 실패
                return new ResponseEntity<String>("BOOK_FAIL", HttpStatus.OK);
            } else { // insert 성공
                seat_theaterService.update_false(s_id); // s_is_available false로 업데이트
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
