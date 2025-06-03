package com.bitstudy.app.service;

import com.bitstudy.app.domain.MovieDto;

import java.util.List;

public interface MovieService {
    List<MovieDto> selectAll();

    MovieDto selectOneMovie(String movie_cd);

    List<MovieDto> selectByGenre(String genre_nm);

    List<MovieDto> selectAllByRating();

    List<MovieDto> selectTop10();

//    List<MovieDto> selectTop5();

    List<MovieDto> search_title(String title);

//    int insert(MovieDto movieDto);
//
//    int deleteAll();
}
