package com.bitstudy.app.controller;

import com.bitstudy.app.dao.TheaterDao;
import com.bitstudy.app.dao.UserDao;
import com.bitstudy.app.domain.*;
import com.bitstudy.app.service.Book_movieService;
import com.bitstudy.app.service.Book_musicalService;
import com.bitstudy.app.service.Book_theaterService;
import com.bitstudy.app.service.MusicalService;
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

    @GetMapping("/book")
    public String book(HttpServletRequest request, Model model) {
        if(!isLogin(request)) {
            HttpSession session = request.getSession();
            session.setAttribute("toUrl", request.getServletPath());
            return "redirect:/logIn";
        }

        List<MusicalDto> musicalList = musicalService.selectAll();
        model.addAttribute("musicalList", musicalList);
        List<TheaterDto> theaterList = theaterDao.selectAll();
        model.addAttribute("theaterList", theaterList);
//        List<MusicalDto> movieList = movieService.selectAll();
//        model.addAttribute("movieList", movieList);

        return "book";
    }

//    @PostMapping("/book/theater") // 영화 예매 > ajax로 Book_movieDto 받아서 book_movie_tbl에 저장
//    @ResponseBody
//    public ResponseEntity<String> addBook(@RequestBody Book_movieDto book_movieDto, HttpSession session) {
//    Integer b_user_seqno = (Integer) session.getAttribute("u_seqno");
//    book_movieDto.setB_user_seqno(b_user_seqno); // 세션에서 u_seqno 받아서 저장
//
//    try {
//        int rowCount = book_movieService.insert(book_movieDto); // insert가 성공하면 rowCount == 1
//        if (rowCount == 0) { // insert 실패
//            return new ResponseEntity<String>("BOOK_FAIL", HttpStatus.OK);
//        } else { // insert 성공
//            return new ResponseEntity<String>("BOOK_OK", HttpStatus.OK);
//
//        }
//    }
//        catch (Exception e) { //
//            e.printStackTrace();
//            return new ResponseEntity<String>("BOOK_ERROR", HttpStatus.BAD_REQUEST);
//        }
//    }

    @GetMapping("/book/musical") // 뮤지컬 상세 페이지에서 mu_id받아서 예매하기로 들어옴
    public String book_musical(@RequestParam(value = "code", required = false) String mu_id, HttpServletRequest request, Model model) {
        if(!isLogin(request)) {
            HttpSession session = request.getSession();
            session.setAttribute("toUrl", request.getServletPath());
            session.setAttribute("query", request.getQueryString());
            return "redirect:/logIn";
        }
        if(mu_id == null || "".equals(mu_id)) { // mu_id가 없으면 (상세 페이지에서 들어온게 아니면)
            return "redirect:/book";
        }
        else{
            List<MusicalDto> musicalList = musicalService.selectAll(); // 뮤지컬 전부 불러옴
            model.addAttribute("musicalList", musicalList); // musicalList view로 전달
            MusicalDto musicalDto = musicalService.select(mu_id); // 받아온 mu_id로 musicalDto 하나 불러옴
            model.addAttribute("musicalDto", musicalDto); // model에 musicalDto 담아서 view로 보냄
                                                            // view에서 해당 뮤지컬 선택되게
            return "book";
        }
    }
    
    @PostMapping("/book/musical") // 뮤지컬 예매 > ajax로 Book_musicalDto 받아서 m_code, s_id 받아옴 book_musical_tbl에 저장
    @ResponseBody
    public ResponseEntity<String> addBook(@RequestBody Book_musicalDto book_musicalDto, HttpSession session) {
        UserDto userDto = userDao.selectUser( (String)session.getAttribute("u_id")); // 세션에서 u_id 받아서 해당 userDto 저장
        Integer b_user_seqno = userDto.getU_seqno(); // 해당 user_seqno 받아와서
        book_musicalDto.setB_user_seqno(b_user_seqno); // book_musicalDto에 set

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


    private boolean isLogin(HttpServletRequest request){
        HttpSession session = request.getSession();

        return session.getAttribute("u_id") != null;
    }
}
