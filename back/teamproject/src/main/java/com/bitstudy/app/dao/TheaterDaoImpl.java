package com.bitstudy.app.dao;

import com.bitstudy.app.domain.TheaterDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class TheaterDaoImpl implements TheaterDao {
    @Autowired
    private SqlSession session;

    String nameSpace = "com.bitstudy.app.dao.theaterMapper.";

    @Override
    public List<TheaterDto> selectAll(){
        return session.selectList(nameSpace+"selectAll");
    }

    @Override
    public TheaterDto selectById(){
        return session.selectOne(nameSpace+"selectById");
    }
}
