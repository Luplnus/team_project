package com.bitstudy.app.dao;

import com.bitstudy.app.domain.Book_musicalDto;

import java.util.List;

public interface Book_musicalDao {
    int count();
    int insert(Book_musicalDto book_musicalDto);
    int deleteAll();
    int delete(Integer b_seqno, String b_user_seqno);
    List<Book_musicalDto> selectAll_newest();
    List<Book_musicalDto> selectAll_oldest();
    List<Book_musicalDto> selectAll_price();
    Book_musicalDto select(Integer b_seqno);
}
