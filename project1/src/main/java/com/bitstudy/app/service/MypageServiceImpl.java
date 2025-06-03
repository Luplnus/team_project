package com.bitstudy.app.service;

import com.bitstudy.app.dao.UserDao;
import com.bitstudy.app.domain.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MypageServiceImpl implements MypageService {
    @Autowired
    UserDao userDao;

    @Override
    public UserDto selectUser(String u_id){
        return userDao.selectUser(u_id);
    }

    @Override
    public int remove(String u_id){
        return userDao.deleteUser(u_id);
    }

    @Override
    public int modify(UserDto userDto){
        return userDao.updateUser(userDto);
    }
}
