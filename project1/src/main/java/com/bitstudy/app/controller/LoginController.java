package com.bitstudy.app.controller;

import com.bitstudy.app.dao.UserDao;
import com.bitstudy.app.domain.UserDto;
import com.bitstudy.app.domain.UserLoginDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.*;
import java.net.URLEncoder;


@Controller
public class LoginController {

    @Autowired
    UserDao userDao;

    @GetMapping("/logIn")
    public String logInPage(){
        return "login";
    }
    @PostMapping("/logIn")
    public String logIn(HttpServletRequest request, HttpServletResponse response, UserLoginDto userLoginDto) throws Exception{
        String u_id = userLoginDto.getU_id();
        String u_pw = userLoginDto.getU_pw();
        boolean u_rId = userLoginDto.isU_rId();

        if (LoginChk(u_id, u_pw)){
            HttpSession session = request.getSession();
            session.setAttribute("u_id", u_id);

            Cookie cookie = new Cookie("u_id", u_id);
            cookie.setMaxAge(u_rId?60*60*24*365:0);
            response.addCookie(cookie);

            String toURL = String.valueOf(session.getAttribute("toUrl"));
            String query = String.valueOf(session.getAttribute("query"));
            toURL = toURL.equals("null") || toURL.equals("")?"/":toURL;
            query = query.equals("null") || query.equals("")?"/": "?" + query;
            session.removeAttribute("toUrl");
            return "redirect:"+toURL+query;
        }
        String msg = URLEncoder.encode("일치하는 회원없음. 회원가입 ㄱㄱ","utf-8");
        return "redirect:/logIn?msg="+msg;
    }

    @GetMapping("/logOut")
    public String logOut(HttpSession session){
    session.invalidate();

    return "redirect:/";
    }

    public boolean LoginChk(String u_id, String u_pw){
        UserDto selectUser= userDao.selectUser(u_id);

        if (selectUser == null){
            return false;
        }
        return selectUser.getU_pw().equals(u_pw);
    }
}
