package com.bitstudy.app.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class Seat_theaterDaoImpl implements Seat_theaterDao {

    @Autowired
    private SqlSession session;

    private String namespace = "com.bitstudy.app.dao.Seat_theaterMapper.";

    @Override
    public int select_s_id(String t_id, String s_label) { // 각 코드와 좌석라벨로 데이터베이스 조회
        Map map =new HashMap();
        map.put("t_id", t_id);
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
