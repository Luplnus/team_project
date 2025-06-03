package com.bitstudy.app.dao;

import com.bitstudy.app.domain.TheaterDto;

import java.util.List;

public interface TheaterDao {
    List<TheaterDto> selectAll();

    List<TheaterDto> selectAllByEndDate();

    TheaterDto selectOneMovie(String t_id);

    List<TheaterDto> selectByGenre(String t_genre);

    List<TheaterDto> selectTop5();
}
