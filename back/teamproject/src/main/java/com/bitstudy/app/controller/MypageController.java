package com.bitstudy.app.controller;

//import com.bitstudy.app.dao.UserDao;
//import com.bitstudy.app.domain.UserDto;
//import com.bitstudy.app.service.MypageService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//@Controller
//public class MypageController {
//
//    @Autowired
//    MypageService mypageService;
//
//    @GetMapping("/myPage")
//    public String getUser(Model m, HttpServletRequest request){
//        if(!loginChk(request)) {
//            HttpSession session = request.getSession();
//            session.setAttribute("toUrl", request.getServletPath());
//            return "redirect:/login";
//        }
//
//        HttpSession session = request.getSession();
//        String u_id = (String) session.getAttribute("u_id");
//        UserDto userDto = mypageService.selectUser(u_id);
//
//        m.addAttribute("userDto", userDto);
//
//        return "myPage";
//    }
//
//    @PostMapping("/myPage/modify")
//    public String modify(Model m, UserDto userDto, HttpServletRequest request){
//        if(!loginChk(request)) {
//            HttpSession session = request.getSession();
//            session.setAttribute("toUrl", request.getServletPath());
//            return "redirect:/login";
//        }
//
//        HttpSession session = request.getSession();
//        String u_id = (String) session.getAttribute("u_id");
//        userDto.setU_id(u_id);
//
//        m.addAttribute("u_id", u_id);
//
//        mypageService.modify(userDto);
//        return "redirect:/myPage";
//    }
//
//
//    @PostMapping("/myPage/remove")
//    public String remove(HttpServletRequest request){
//        if(!loginChk(request)) {
//            HttpSession session = request.getSession();
//            session.setAttribute("toUrl", request.getServletPath());
//            return "redirect:/login";
//        }
//
//        HttpSession session = request.getSession();
//        String u_id = (String) session.getAttribute("u_id");
//        mypageService.remove(u_id);
//
//        return "redirect:/main";
//    }
//
//
//    public boolean loginChk(HttpServletRequest request){
//        HttpSession session = request.getSession();
//
//        return session.getAttribute("u_id") != null;
//    }
//}


import com.bitstudy.app.dao.UserDao;
import com.bitstudy.app.domain.RecentlistDto;
import com.bitstudy.app.domain.UserDto;
import com.bitstudy.app.domain.WishlistDto;
import com.bitstudy.app.service.MypageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "*")
public class MypageController {

    @Autowired
    MypageService mypageService;
    @Autowired
    UserDao userDao;


    // 유저 불러오기
    @GetMapping("/user/{u_id}")
    public ResponseEntity<UserDto> getUserInfo(@PathVariable String u_id) {
        UserDto user = mypageService.selectUser(u_id);
        if (user == null) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(user);
    }

    // 수정
    @PostMapping("/user/modify/{u_id}")
    public ResponseEntity<String> modifyUserInfo(@PathVariable String u_id, @RequestBody UserDto userDto) {
        userDto.setU_id(u_id);
        int updated = mypageService.modify(userDto);
        if (updated > 0) {
            return ResponseEntity.ok("success");
        }
        return ResponseEntity
                .status(HttpStatus.INTERNAL_SERVER_ERROR)
                .body("failed");
    }

    // 회원탈퇴
    @PostMapping("/user/remove/{u_id}")
    public ResponseEntity<String> removeUser(@PathVariable String u_id) {
        int deleted = mypageService.remove(u_id);
        if (deleted > 0) {
            return ResponseEntity.ok("deleted");
        }
        return ResponseEntity.notFound().build();
    }

    //찜
    @GetMapping("/user/{u_id}/wishlist")
    public ResponseEntity<List<WishlistDto>> getWishlist(@PathVariable("u_id") String u_id) {
        int u_seqno = mypageService.findSeqnoByUserId(u_id);
        if (u_seqno == 0) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
        List<WishlistDto> list = mypageService.getAllWishlist(u_seqno);
        return ResponseEntity.ok(list);
    }

    // 찜 추가
    @PostMapping("/user/{u_id}/wishlist/add")
    public ResponseEntity<Map<String, String>> addWishContent(@PathVariable("u_id") String u_id, @RequestBody Map<String, String> map) {

        WishRequest request = UserWishContent(u_id, map);

        Map<String, String> response = new HashMap<>();
        try {
            mypageService.addWishContent(request.u_seqno, request.w_contentType, request.w_contentId);
            response.put("message", "찜 목록에 추가되었습니다.");
            return ResponseEntity.status(HttpStatus.CREATED).body(response);
        } catch (Exception e) {
            response.put("message", "찜 추가 중 오류가 발생했습니다.");
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(response);
        }
    }

    // 찜 삭제
    @PostMapping("/user/{u_id}/wishlist/remove")
    public ResponseEntity<Map<String, String>> removeWishContent(@PathVariable("u_id") String u_id, @RequestBody Map<String, String> map) {

        WishRequest request = UserWishContent(u_id, map);

        Map<String, String> response = new HashMap<>();
        try {
            mypageService.removeWishContent(request.u_seqno, request.w_contentType, request.w_contentId);
            response.put("message", "찜 목록에서 제거되었습니다.");
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            response.put("message", "찜 삭제 중 오류가 발생했습니다.");
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(response);
        }
    }

    // 최근 결제 불러오기
    @GetMapping("/user/{u_id}/recentlist")
    public ResponseEntity<List<RecentlistDto>> getRecentlist(@PathVariable("u_id") String u_id)
    {
        UserDto user = userDao.selectUser(u_id);
        if (user == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        int u_seqno = user.getU_seqno();

        List<RecentlistDto> recentList = mypageService.getRecentByUserSeqno(u_seqno);
        return new ResponseEntity<>(recentList, HttpStatus.OK);
    }




    // 유저 아이디, 컨텐츠타입이랑 컨텐츠아이디 한번에 받는 클래스
    public static class WishRequest {

        int u_seqno;
        String w_contentType;
        String w_contentId;

        WishRequest(int u_seqno, String w_contentType, String w_contentId) {
            this.u_seqno     = u_seqno;
            this.w_contentType = w_contentType;
            this.w_contentId = w_contentId;
        }
    }

    public WishRequest UserWishContent(String u_id, Map<String, String> map) {
        int u_seqno = mypageService.findSeqnoByUserId(u_id);
        if (u_seqno == 0) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "존재하지 않는 사용자입니다.");
        }

        String w_contentType = map.get("w_contentType");
        String w_contentId = map.get("w_id");

        if (w_contentType == null || w_contentId == null) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "필수 파라미터(w_contentType 또는 w_id)가 누락되었습니다.");
        }

        return new WishRequest(u_seqno, w_contentType, w_contentId);
    }


}
