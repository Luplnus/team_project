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
    public List<TheaterDto> selectAllByEndDate(){
        return session.selectList(nameSpace+"selectAllByEndDate");
    }

    @Override
    public TheaterDto selectOneMovie(String t_id){
        return session.selectOne(nameSpace+"select", t_id);
    }

    @Override
    public List<TheaterDto> selectByGenre(String t_genre){
        return session.selectList(nameSpace+"selectByGenre", t_genre);
    }

    @Override
    public List<TheaterDto> selectTop5(){
        return session.selectList(nameSpace+"selectTop5");
    }
}
