package com.bitstudy.app.service;

import com.bitstudy.app.domain.Book_theaterDto;

import java.util.List;

public interface Book_theaterService {
    int count();
    int insert(Book_theaterDto book_theaterDto);
    int deleteAll();
    int delete(Integer b_seqno, String b_user_seqno);
    List<Book_theaterDto> selectAll_newest();
    List<Book_theaterDto> selectAll_oldest();
    List<Book_theaterDto> selectAll_price();
    Book_theaterDto select(Integer b_seqno);
}
