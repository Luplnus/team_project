package com.bitstudy.app.controller;

import com.bitstudy.app.dao.UserDao;
import com.bitstudy.app.domain.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.net.URLEncoder;

@Controller
public class RegisterController {

    @Autowired
    UserDao userDao;

    @GetMapping("/register")
    public String registerPage(){
        return "register"; // 회원가입 페이지
    }

    @PostMapping("/postRegister")
    public String postRegister(UserDto userDto) throws Exception {
        if (isValid(userDto)){
            return "/login"; // 로그인페이지
        }
        String msg = URLEncoder.encode("이미 있는 계정이다. 다른걸로 만드삼 ㄱㄱ","utf-8");
        return "redirect:/register?msg="+msg; // 회원가입페이지 리다이렉트
    }

    public boolean isValid(UserDto userDto) {
        String u_id = userDto.getU_id();
        UserDto selectUser = userDao.selectUser(u_id);

        if (selectUser == null){
            return  userDao.insertUser(userDto) == 1;
        }
        return false;
    }
}