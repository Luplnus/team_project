package com.bitstudy.app.service;

import java.util.List;
import java.util.Map;

public interface Seat_movieService {
    int select_s_id(String m_movie_cd, String s_label);
    int update_true(Integer s_id);
    int update_false(Integer s_id);
    List<Map<String, String>> select_false();
}
