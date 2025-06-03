package com.bitstudy.app.service;

import com.bitstudy.app.dao.Seat_musicalDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class Seat_musicalServiceImpl implements  Seat_musicalService {
    @Autowired
    Seat_musicalDao seat_musicalDao;

    @Override
    public int select_s_id(String mu_id, String s_label) {
        return seat_musicalDao.select_s_id(mu_id, s_label);
    }

    @Override
    public int update_true(Integer s_id) {
        return seat_musicalDao.update_true(s_id);
    }

    @Override
    public int update_false(Integer s_id) {
        return seat_musicalDao.update_false(s_id);
    }

    @Override
    public List<Map<String, String>> select_false() {
        return seat_musicalDao.select_false();
    }
}
