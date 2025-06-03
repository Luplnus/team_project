package com.bitstudy.app.service;

import com.bitstudy.app.dao.Book_musicalDao;
import com.bitstudy.app.domain.Book_musicalDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class Book_musicalServiceImpl implements Book_musicalService {
    @Autowired
    Book_musicalDao book_musicalDao;

    @Override
    public int count() {
        return book_musicalDao.count();
    }

    @Override
    public int insert(Book_musicalDto book_musicalDto) {
        return book_musicalDao.insert(book_musicalDto);
    }

    @Override
    public int deleteAll() {
        return book_musicalDao.deleteAll();
    }

    @Override
    public int delete(Integer b_seqno, String b_user_seqno) {
        return book_musicalDao.delete(b_seqno, b_user_seqno);
    }

    @Override
    public List<Book_musicalDto> selectAll_newest() {
        return book_musicalDao.selectAll_newest();
    }

    @Override
    public List<Book_musicalDto> selectAll_oldest() {
        return book_musicalDao.selectAll_oldest();
    }

    @Override
    public List<Book_musicalDto> selectAll_price() {
        return book_musicalDao.selectAll_price();
    }

    @Override
    public Book_musicalDto select(Integer b_seqno) {
        return book_musicalDao.select(b_seqno);
    }
}
