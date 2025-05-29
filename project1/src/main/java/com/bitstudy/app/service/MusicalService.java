package com.bitstudy.app.service;

import com.bitstudy.app.domain.MusicalDto;

import java.util.List;

public interface MusicalService {
    int count();
    int insert(MusicalDto musicalDto);
    int deleteAll();
    int delete(String mu_id);
    List<MusicalDto> selectAll();
    List<MusicalDto> selectAll_title();
    List<MusicalDto> selectAll_title_desc();
    List<MusicalDto> selectAll_genre(String genre);
    MusicalDto select(String mu_id);
    List<MusicalDto> search_title(String title);
}
