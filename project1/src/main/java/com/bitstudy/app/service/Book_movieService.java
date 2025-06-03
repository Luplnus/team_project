package com.bitstudy.app.service;

import com.bitstudy.app.domain.Book_movieDto;

import java.util.List;

public interface Book_movieService {
    int count();
    int insert(Book_movieDto book_movieDto);
    int deleteAll();
    int delete(Integer b_seqno, String b_user_seqno);
    List<Book_movieDto> selectAll_newest();
    List<Book_movieDto> selectAll_oldest();
    List<Book_movieDto> selectAll_price();
    Book_movieDto select(Integer b_seqno);
}
