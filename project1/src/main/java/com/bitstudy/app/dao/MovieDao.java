package com.bitstudy.app.dao;

import com.bitstudy.app.domain.MovieDto;

import java.util.List;

public interface MovieDao {
    List<MovieDto> selectAll();

    MovieDto selectOneMovie(String movie_cd);

    List<MovieDto>  selectByGenre(String genre_nm);

    List<MovieDto> selectAllByRating();

    List<MovieDto> selectTOP10();

    int deleteCloseMovie();

//    List<MovieDto> selectTop5();

    List<MovieDto> search_title(String keyword);


//    안씀
//    int deleteAll();
//
//    int insert(MovieDto movieDto);
}
