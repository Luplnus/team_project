package com.bitstudy.app.controller;

//import com.bitstudy.app.domain.MusicalDto;
//import com.bitstudy.app.service.MusicalService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;
//import java.util.List;
//
//@Controller
//public class MusicalController {
//    @Autowired
//    MusicalService musicalService;
//
//    @GetMapping("/musical")
//    public String musical(@RequestParam(value = "keyword", required = false)String keyword, Model model, HttpServletRequest request) { //
//        HttpSession session = request.getSession();
//
//        if(keyword == null || keyword.isEmpty()) { // keyword가 없을 때 - 처음 들어왔을 때
//            session.removeAttribute("alert"); // search_musical.size() == 0을 한번 했으면 지워줘야함
//            List<MusicalDto> musicalList = musicalService.selectAll(); // musical 목록을 제목순으로 가져와서
//            model.addAttribute("musicalList", musicalList ); // model에 musicalList로 담는다
//        }
//        else{ // keyword가 있을 때 - 검색으로 들어왔을 때
//            List<MusicalDto> search_musical = musicalService.search_title(keyword); // keyword로 검색한 목록을 제목순으로 가져옴
//            if(search_musical.size() == 0) { // keyword가 들어가는 제목의 뮤지컬이 검색되지 않았을 때
//                session.setAttribute("alert", "검색 결과가 없습니다."); // session에 alert를 담는다 -> view에서 not empty sessionScope.alert면 검색 결과가 없습니다.
//            }
//            else{ // keyword가 들어가는 제목의 뮤지컬이 검색되었을 때
//                session.removeAttribute("alert"); // search_musical.size() == 0을 한번 했으면 지워줘야함
//                model.addAttribute("musicalList", search_musical ); // 검색된 뮤지컬들을 model에 musicalList로 담는다
//            }
//
//        }
//        return "Musicalpage";
//    }
//}
import com.bitstudy.app.dao.MusicalDao;
import com.bitstudy.app.dao.TheaterDao;
import com.bitstudy.app.domain.MusicalDto;
import com.bitstudy.app.domain.TheaterDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api")
public class MusicalController {

    @Autowired
    private MusicalDao musicalDao;

    @CrossOrigin(origins = "*")
    @GetMapping("/musicals")
    public List<MusicalDto> getMusicals() {
        return musicalDao.selectAll();
    }

    @GetMapping("/search_musical")
    public List<MusicalDto> searchMusical(String keyword) {
        return musicalDao.search_title(keyword);
    }
}