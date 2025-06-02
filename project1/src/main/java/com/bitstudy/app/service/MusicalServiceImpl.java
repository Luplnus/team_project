package com.bitstudy.app.service;

import com.bitstudy.app.dao.MusicalDao;
import com.bitstudy.app.domain.MusicalDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MusicalServiceImpl implements MusicalService {
    @Autowired
    MusicalDao musicalDao;

    @Override
    public int count() {
        return musicalDao.count();
    }

    @Override
    public int insert(MusicalDto musicalDto) {
        return musicalDao.insert(musicalDto);
    }

    @Override
    public int deleteAll() {
        return musicalDao.deleteAll();
    }

    @Override
    public int delete(String mu_id) {
        return musicalDao.delete(mu_id);
    }

    @Override
    public List<MusicalDto> selectAll() {
        return musicalDao.selectAll();
    }

    @Override
    public List<MusicalDto> selectAll_title() {
        return musicalDao.selectAll_title();
    }

    @Override
    public List<MusicalDto> selectAll_title_desc() {
        return musicalDao.selectAll_title_desc();
    }

    @Override
    public List<MusicalDto> selectAll_genre(String genre) {
        return musicalDao.selectAll_genre(genre);
    }

    @Override
    public MusicalDto select(String mu_id) {
        return musicalDao.select(mu_id);
    }

    @Override
    public List<MusicalDto> search_title(String title) {
        return musicalDao.search_title(title);
    }
}
