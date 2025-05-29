package com.bitstudy.app.controller;

import com.bitstudy.app.dao.UserDao;
import com.bitstudy.app.domain.UserDto;
import com.bitstudy.app.service.MypageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class MypageController {

    @Autowired
    MypageService mpservice;

    @GetMapping("/myPage")
    public String getUser(Model m, HttpServletRequest request){
        if(!loginChk(request)) {
            HttpSession session = request.getSession();
            session.setAttribute("toUrl", request.getServletPath());
            return "redirect:/login";
        }

        HttpSession session = request.getSession();
        String u_id = (String) session.getAttribute("u_id");
        UserDto userDto = mpservice.selectUser(u_id);

        m.addAttribute("userDto", userDto);

        return "myPage";
    }

    @PostMapping("/myPage/modify")
    public String modify(Model m, UserDto userDto, HttpServletRequest request){
        if(!loginChk(request)) {
            HttpSession session = request.getSession();
            session.setAttribute("toUrl", request.getServletPath());
            return "redirect:/login";
        }

        HttpSession session = request.getSession();
        String u_id = (String) session.getAttribute("u_id");
        userDto.setU_id(u_id);

        m.addAttribute("u_id", u_id);

        mpservice.modify(userDto);
        return "redirect:/myPage";
    }


    @PostMapping("/myPage/remove")
    public String remove(HttpServletRequest request){
        if(!loginChk(request)) {
            HttpSession session = request.getSession();
            session.setAttribute("toUrl", request.getServletPath());
            return "redirect:/login";
        }

        HttpSession session = request.getSession();
        String u_id = (String) session.getAttribute("u_id");
        mpservice.remove(u_id);

        return "redirect:/main";
    }


    public boolean loginChk(HttpServletRequest request){
        HttpSession session = request.getSession();

        return session.getAttribute("u_id") != null;
    }
}
