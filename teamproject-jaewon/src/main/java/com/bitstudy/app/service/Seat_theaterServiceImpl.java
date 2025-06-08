package com.bitstudy.app.service;

import com.bitstudy.app.dao.Seat_theaterDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class Seat_theaterServiceImpl implements  Seat_theaterService {
    @Autowired
    Seat_theaterDao seat_theaterDao;

    @Override
    public int select_s_id(String t_id, String s_label) {
        return seat_theaterDao.select_s_id(t_id, s_label);
    }

    @Override
    public int update_true(Integer s_id) {
        return seat_theaterDao.update_true(s_id);
    }

    @Override
    public int update_false(Integer s_id) {
        return seat_theaterDao.update_false(s_id);
    }

    @Override
    public List<Map<String, String>> select_false() {
        return seat_theaterDao.select_false();
    }
}
