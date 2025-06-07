package com.bitstudy.app.service;

import com.bitstudy.app.dao.Seat_movieDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class Seat_movieServiceImpl implements  Seat_movieService {
    @Autowired
    Seat_movieDao seat_movieDao;

    @Override
    public int select_s_id(String m_movie_cd, String s_label) {
        return seat_movieDao.select_s_id(m_movie_cd, s_label);
    }

    @Override
    public int update_true(Integer s_id) {
        return seat_movieDao.update_true(s_id);
    }

    @Override
    public int update_false(Integer s_id) {
        return seat_movieDao.update_false(s_id);
    }

    @Override
    public List<Map<String, String>> select_false() {
        return seat_movieDao.select_false();
    }
}
