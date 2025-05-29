package com.bitstudy.app.controller;

//import com.bitstudy.app.dao.TheaterDao;
//import com.bitstudy.app.domain.TheaterDto;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.*;
//import org.springframework.web.client.RestTemplate;
//
//import java.util.Arrays;
//import java.util.Collections;
//import java.util.List;
//
//
//@Controller
//public class TheaterController {
//    @Autowired
//    TheaterDao theaterDao;
//
//    @GetMapping("/theater")
//    public String theater(Model m, String t_id){
//        TheaterDto theaterDto = theaterDao.selectOneMovie(t_id);
//        m.addAttribute("theaterDto", theaterDto);
//        return "theater"; // 상세페이지
//    }
//
//    @GetMapping("/theaterList")
//    public String theaterList(Model m){
//        List<TheaterDto> list = theaterDao.selectAllByStartDate();
//        m.addAttribute("list", list);
//        return "theaterList"; // theaterList.jsp 뷰 이름
//    }
//
//}


//package com.bitstudy.app.controller;
//
//import com.bitstudy.app.domain.TheaterDto;  // ← 맞게 import
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.*;
//import org.springframework.web.client.RestTemplate;
//import java.util.Arrays;
//import java.util.Collections;
//import java.util.List;
//
//@RestController
//@RequestMapping("/java")
//@CrossOrigin(origins = "*")
//public class TheaterController {
//
//    @GetMapping(value = "/theaters", produces = "application/json")
//    public List<TheaterDto> getTheaters() {
//        RestTemplate rest = new RestTemplate();
//        String url = "http://43.201.82.158:5000/api/theaters";
//        try {
//            TheaterDto[] arr = rest.getForObject(url, TheaterDto[].class);
//            return Arrays.asList(arr);
//        } catch (Exception ex) {
//            System.err.println("Flask API 호출 실패: " + ex.getMessage());
//            return Collections.emptyList();
//        }
//    }
//}

import com.bitstudy.app.dao.TheaterDao;
import com.bitstudy.app.domain.TheaterDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api")
public class TheaterController {

    @Autowired
    private TheaterDao theaterDao;

    @CrossOrigin(origins = "*")
    @GetMapping("/theaters")
    public List<TheaterDto> getTheaters() {
        return theaterDao.selectAll();
    }
}
