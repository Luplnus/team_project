package com.bitstudy.app.dao;

public interface Seat_musicalDao {
    int select_s_id(String mu_id, String s_label);
    int update_true(Integer s_id);
    int update_false(Integer s_id);
}
