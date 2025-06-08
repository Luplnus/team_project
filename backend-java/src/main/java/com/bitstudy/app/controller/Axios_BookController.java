package com.bitstudy.app.controller;

import com.bitstudy.app.dao.*;
import com.bitstudy.app.domain.MovieDto;
import com.bitstudy.app.domain.MusicalDto;
import com.bitstudy.app.domain.TheaterDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api")
public class Axios_BookController {
    @Autowired
    private MovieDao movieDao;
    @Autowired
    private MusicalDao musicalDao;
    @Autowired
    private TheaterDao theaterDao;
    @Autowired
    private Seat_movieDao seat_movieDao;
    @Autowired
    private Seat_musicalDao seat_musicalDao;
    @Autowired
    private Seat_theaterDao seat_theaterDao;

    @CrossOrigin(origins = "*")
    @GetMapping("/book")
    public Map<String, List<?>> getAllContents() {
        Map<String, List<?>> contentMap = new HashMap<>();
        contentMap.put("movies", movieDao.selectAll());
        contentMap.put("musicals", musicalDao.selectAll());
        contentMap.put("theaters", theaterDao.selectAll());
        contentMap.put("s_is_available_movie", seat_movieDao.select_false());
        contentMap.put("s_is_available_musical", seat_musicalDao.select_false());
        contentMap.put("s_is_available_theater", seat_theaterDao.select_false());
        return contentMap;
    }

//    @GetMapping("/loginChk")
//    public boolean loginChk(HttpSession session) {
//        boolean loginChk = session.getAttribute("u_id") != null; // 세션에 id가 있으면 true 없으면 false
//        return loginChk;
//    }
}