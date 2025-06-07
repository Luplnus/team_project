package com.bitstudy.app.dao;

import com.bitstudy.app.domain.MovieDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MovieDaoImpl implements MovieDao {
    @Autowired
    private SqlSession session;

    String nameSpace = "com.bitstudy.app.dao.movieMapper.";

    @Override
    public List<MovieDto> selectAll(){
        return session.selectList(nameSpace+"selectAll");
    }

    @Override
    public MovieDto selectOneMovie(String movie_cd){
        return session.selectOne(nameSpace+"select", movie_cd);
    }

    @Override
    public List<MovieDto> selectByGenre(String genre_nm){
        return session.selectList(nameSpace+"selectByGenre", genre_nm);
    }

    @Override
    public List<MovieDto> selectAllByRating(){
        return session.selectList(nameSpace+"selectByRating");
    }

    @Override
    public List<MovieDto> selectTOP10(){ return session.selectList(nameSpace+"selectTOP10"); }

    @Override
    public List<MovieDto> search_title(String keyword) {
        return session.selectList(nameSpace+"search_title", keyword);
    }
}
