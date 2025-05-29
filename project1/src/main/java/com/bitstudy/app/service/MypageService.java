package com.bitstudy.app.service;

import com.bitstudy.app.domain.UserDto;

public interface MypageService {
    UserDto selectUser(String u_id);

    int remove(String u_id);

    int modify(UserDto userDto);
}
