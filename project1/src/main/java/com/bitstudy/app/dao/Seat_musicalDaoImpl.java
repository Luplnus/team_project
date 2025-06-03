package com.bitstudy.app.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class Seat_musicalDaoImpl implements Seat_musicalDao {

    @Autowired
    private SqlSession session;

    private String namespace = "com.bitstudy.app.dao.Seat_musicalMapper.";

    @Override
    public int select_s_id(String mu_id, String s_label) {
        Map map =new HashMap();
        map.put("mu_id", mu_id);
        map.put("s_label", s_label);

        return session.selectOne(namespace + "select_s_id", map);
    }

    @Override
    public int update_true(Integer s_id) {
        return session.update(namespace + "update_true", s_id);
    }

    @Override
    public int update_false(Integer s_id) {
        return session.update(namespace + "update_false", s_id);
    }

    @Override
    public List<Map<String, String>> select_false() {
        return session.selectList(namespace + "select_false");
    }


}
