package com.bitstudy.app.dao;

import com.bitstudy.app.domain.Book_theaterDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class Book_theaterDaoImpl implements Book_theaterDao {

    @Autowired
    private SqlSession session;

    private String namespace = "com.bitstudy.app.dao.Book_theaterMapper.";

    @Override
    public int count() {
        return session.selectOne(namespace + "count");
    }

    @Override
    public int insert(Book_theaterDto book_theaterDto) {
        return session.insert(namespace+"insert", book_theaterDto);
    }

    @Override
    public int deleteAll() {
        return session.delete(namespace +"deleteAll");
    }

    @Override
    public int delete(Integer b_seqno, String b_user_seqno) {
        // 삭제시 예매 번호와 예매 id 정보 넘김
        Map map = new HashMap();
        map.put("b_seqno", b_seqno);
        map.put("b_user_seqno", b_user_seqno);

        return session.delete(namespace +"delete", map);
    }

    // 최신순
    @Override
    public List<Book_theaterDto> selectAll_newest() {
        return session.selectList(namespace+"selectAll_newest");
    }
    // 오래된순
    @Override
    public List<Book_theaterDto> selectAll_oldest() {
        return session.selectList(namespace+"selectAll_oldest");
    }
    // 가격순
    @Override
    public List<Book_theaterDto> selectAll_price() {
        return session.selectList(namespace+"selectAll_price");
    }

    @Override
    public Book_theaterDto select(Integer b_seqno) {
        return session.selectOne(namespace+"select", b_seqno);
    }
}
