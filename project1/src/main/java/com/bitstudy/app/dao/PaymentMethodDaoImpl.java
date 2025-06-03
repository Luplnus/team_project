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

    private String namespace = "com.bitstudy.app.dao.paymentMapper.";

    @Override
    public List<PaymentMethodDto> selectAll() {  return session.selectList(namespace+"selectAll"); }

    @Override
    public int cardPayment(PaymentMethodDto dto) {
        return session.insert(namespace + "cardPayment", dto);
    }

    @Override
    public int accountPayment(PaymentMethodDto dto) {
        return session.insert(namespace + "accountPayment", dto);
    }

    @Override
    public int update(PaymentMethodDto dto) {
        return session.update(namespace + "update", dto);
    }



}
