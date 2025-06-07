package com.bitstudy.app.dao;

import com.bitstudy.app.domain.Book_movieDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class Book_movieDaoImpl implements Book_movieDao {

    @Autowired
    private SqlSession session;

    private String namespace = "com.bitstudy.app.dao.Book_movieMapper.";

    @Override
    public int count() {
        return session.selectOne(namespace + "count");
    }

    @Override
    public int insert(Book_movieDto book_movieDto) {
        return session.insert(namespace+"insert", book_movieDto);
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
    public List<Book_movieDto> selectAll_newest() {
        return session.selectList(namespace+"selectAll_newest");
    }
    // 오래된순
    @Override
    public List<Book_movieDto> selectAll_oldest() {
        return session.selectList(namespace+"selectAll_oldest");
    }
    // 가격순
    @Override
    public List<Book_movieDto> selectAll_price() {
        return session.selectList(namespace+"selectAll_price");
    }

    @Override
    public Book_movieDto select(Integer b_seqno) {
        return session.selectOne(namespace+"select", b_seqno);
    }
}
