package com.bitstudy.app.controller;

import com.bitstudy.app.dao.UserDao;
import com.bitstudy.app.domain.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "*")
public class RegisterController {

    @Autowired
    UserDao userDao;

    @PostMapping("/register")
    public ResponseEntity<Map> register(@RequestBody UserDto userDto) {
        // 중복 검사
        if (userDao.selectUser(userDto.getU_id()) != null) {
            return ResponseEntity
                    .status(HttpStatus.CONFLICT)
                    .body(Map.of("message", "이미 존재하는 아이디입니다."));
        }
        int inserted = userDao.insertUser(userDto);
        if (inserted == 1) {
            return ResponseEntity
                    .status(HttpStatus.CREATED)
                    .body(Map.of("message", "회원가입 완료"));
        } else {
            return ResponseEntity
                    .status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(Map.of("message", "회원가입에 실패했습니다."));
        }
    }
}
