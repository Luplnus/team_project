package com.bitstudy.app.dao;

import com.bitstudy.app.domain.UserDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImpl implements UserDao {

    String nameSpace = "com.bitstudy.app.dao.userMapper.";

    @Autowired
    private SqlSession session;

    @Override
    public int insertUser(UserDto userDto){
        return session.insert(nameSpace+"insertUser", userDto);
    }

    @Override
    public UserDto selectUser(String u_id){
        return session.selectOne(nameSpace+"selectUser", u_id);
    }

    @Override
    public int selectUserSeqnoById(String u_id) { return session.selectOne(nameSpace+"selectUserSeqnoById", u_id); }

    @Override
    public int deleteUser(String u_id){
        return session.delete(nameSpace+"deleteUser", u_id);
    }

    @Override
    public int updateUser(UserDto userDto){
        return session.update(nameSpace+"updateUser", userDto);
    }
}
