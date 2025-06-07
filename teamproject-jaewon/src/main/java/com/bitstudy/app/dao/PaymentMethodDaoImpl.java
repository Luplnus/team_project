package com.bitstudy.app.dao;

import com.bitstudy.app.domain.PaymentMethodDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PaymentMethodDaoImpl implements PaymentMethodDao {

    @Autowired
    private SqlSession session;

    private String namespace = "com.bitstudy.app.dao.paymentMethodMapper.";

    @Override
    public List<PaymentMethodDto> selectAll() {  return session.selectList(namespace+"selectAll"); }

    @Override
    public int isCorrect(PaymentMethodDto dto) { return session.selectOne(namespace + "isCorrect", dto); }
}
