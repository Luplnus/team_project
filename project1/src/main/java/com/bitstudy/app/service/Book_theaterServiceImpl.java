package com.bitstudy.app.service;

import com.bitstudy.app.dao.Book_theaterDao;
import com.bitstudy.app.domain.Book_theaterDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class Book_theaterServiceImpl implements Book_theaterService {
    @Autowired
    Book_theaterDao book_theaterDao;

    @Override
    public int count() {
        return book_theaterDao.count();
    }

    @Override
    public int insert(Book_theaterDto book_theaterDto) {
        return book_theaterDao.insert(book_theaterDto);
    }

    @Override
    public int deleteAll() {
        return book_theaterDao.deleteAll();
    }

    @Override
    public int delete(Integer b_seqno, String b_user_seqno) {
        return book_theaterDao.delete(b_seqno, b_user_seqno);
    }

    @Override
    public List<Book_theaterDto> selectAll_newest() {
        return book_theaterDao.selectAll_newest();
    }

    @Override
    public List<Book_theaterDto> selectAll_oldest() {
        return book_theaterDao.selectAll_oldest();
    }

    @Override
    public List<Book_theaterDto> selectAll_price() {
        return book_theaterDao.selectAll_price();
    }

    @Override
    public Book_theaterDto select(Integer b_seqno) {
        return book_theaterDao.select(b_seqno);
    }
}
