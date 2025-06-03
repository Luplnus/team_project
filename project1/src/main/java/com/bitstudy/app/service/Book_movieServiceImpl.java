package com.bitstudy.app.service;

import com.bitstudy.app.dao.Book_movieDao;
import com.bitstudy.app.domain.Book_movieDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class Book_movieServiceImpl implements Book_movieService {
    @Autowired
    Book_movieDao book_movieDao;

    @Override
    public int count() {
        return book_movieDao.count();
    }

    @Override
    public int insert(Book_movieDto book_movieDto) {
        return book_movieDao.insert(book_movieDto);
    }

    @Override
    public int deleteAll() {
        return book_movieDao.deleteAll();
    }

    @Override
    public int delete(Integer b_seqno, String b_user_seqno) {
        return book_movieDao.delete(b_seqno, b_user_seqno);
    }

    @Override
    public List<Book_movieDto> selectAll_newest() {
        return book_movieDao.selectAll_newest();
    }

    @Override
    public List<Book_movieDto> selectAll_oldest() {
        return book_movieDao.selectAll_oldest();
    }

    @Override
    public List<Book_movieDto> selectAll_price() {
        return book_movieDao.selectAll_price();
    }

    @Override
    public Book_movieDto select(Integer b_seqno) {
        return book_movieDao.select(b_seqno);
    }
}
