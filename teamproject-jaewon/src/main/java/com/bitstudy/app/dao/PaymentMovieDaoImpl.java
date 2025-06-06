package com.bitstudy.app.dao;

import com.bitstudy.app.domain.PaymentMovieDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PaymentMovieDaoImpl implements PaymentMovieDao {

    @Autowired
    private SqlSession session;

    private String namespace = "com.bitstudy.app.dao.paymentMovieMapper.";

    @Override
    public List<PaymentMovieDto> selectAllMovie() {
        return session.selectList(namespace + "selectAllMovie");
    }
}

