package com.bitstudy.app.dao;

import com.bitstudy.app.domain.TheaterDto;

import java.util.List;

public interface TheaterDao {
    List<TheaterDto> selectAll();

    TheaterDto selectById();
}
