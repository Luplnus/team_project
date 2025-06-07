package com.bitstudy.app.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class UserDaoImplTest {

    @Autowired
    UserDao userDao;

    @Test
    public void insertUser() {
        UserDto userDto = new UserDto("asdf", "1234", "홍길동", "asdf@asdf.com", "adress", "010-0000-0000");
        assertTrue(userDao.insertUser(userDto) == 1);
    }

    @Test
    public void selectUser() {
        UserDto userDto = userDao.selectUser("asdf");
        System.out.println("UserDto: "+userDto);
    }

    @Test
    public void deleteUser() {
        userDao.deleteUser("asdf");
    }

    @Test
    public void updateUser() {
        UserDto userDto = new UserDto("asdf2", "1234", "김길동", "asdf@asdf.com", "adress2", "010-0000-0000");
        userDao.updateUser(userDto);
    }
}