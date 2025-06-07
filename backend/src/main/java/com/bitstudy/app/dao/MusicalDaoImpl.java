package com.bitstudy.app.dao;

import com.bitstudy.app.domain.MusicalDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MusicalDaoImpl implements MusicalDao {

    @Autowired
    private SqlSession session;

    private String namespace = "com.bitstudy.app.dao.MusicalMapper.";

    @Override
    public int count() {
        return session.selectOne(namespace + "count");
    }

    @Override
    public int insert(MusicalDto musicalDto) {
        return session.insert(namespace + "insert", musicalDto);
    }

    @Override
    public int deleteAll() {
        return session.delete(namespace + "deleteAll");
    }

    @Override
    public int delete(String mu_id) {
        return session.delete(namespace + "delete", mu_id);
    }

    @Override
    public List<MusicalDto> selectAll() {
        return session.selectList(namespace + "selectAll");
    }

    @Override
    public List<MusicalDto> selectAll_title() {
        return session.selectList(namespace + "selectAll_title");
    }

    @Override
    public List<MusicalDto> selectAll_title_desc() {
        return session.selectList(namespace + "selectAll_title_desc");
    }

    @Override
    public List<MusicalDto> selectAll_genre(String genre) {
        return session.selectList(namespace + "selectAll_genre", genre);
    }

    @Override
    public MusicalDto select(String mu_id) {
        return session.selectOne(namespace + "select", mu_id);
    }

    @Override
    public List<MusicalDto> search_title(String keyword) {
        return session.selectList(namespace + "search_title", keyword);
    }
}
