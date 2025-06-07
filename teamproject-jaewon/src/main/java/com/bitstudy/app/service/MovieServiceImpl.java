package com.bitstudy.app.service;

import com.bitstudy.app.dao.MovieDao;
import com.bitstudy.app.domain.MovieDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MovieServiceImpl implements MovieService {

    @Autowired
    MovieDao movieDao;

    @Override
    public List<MovieDto> selectAll() {
        return movieDao.selectAll();
    }

    @Override
    public MovieDto selectOneMovie(String movie_cd) {
        return movieDao.selectOneMovie(movie_cd);
    }

    @Override
    public List<MovieDto> selectByGenre(String genre_nm) {
        return movieDao.selectByGenre(genre_nm);
    }

    @Override
    public List<MovieDto> selectAllByRating() {
        return movieDao.selectAllByRating();
    }

    @Override
    public List<MovieDto> selectTop10() { return movieDao.selectTOP10(); }

    @Override
    public List<MovieDto> search_title(String title) { return movieDao.search_title(title); }

}
