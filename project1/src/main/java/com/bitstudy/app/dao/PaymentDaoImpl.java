package com.bitstudy.app.dao;

import com.bitstudy.app.domain.PaymentDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PaymentDaoImpl implements PaymentDao {

    @Autowired
    private SqlSession session;

    private String namespace = "com.bitstudy.app.dao.PaymentMapper.";

    //    @Override
//    public List<PaymentDto> selectAll() {  return session.selectList(namespace+"selectAll"); }
//
    @Override
    public PaymentDto selectByPmId(int p_seqno) {
        return session.selectOne(namespace + "selectByPmId", p_seqno);
    }

    @Override
    public PaymentDto selectByUserId(int p_user_seqno) {
        return session.selectOne(namespace + "selectByUserId", p_user_seqno);
    }

    @Override
    public PaymentDto selectByBookId(int p_book_seqno) {
        return session.selectOne(namespace + "selectByBookId", p_book_seqno);
    }

    @Override
    public PaymentDto selectByPayment(int p_pm_seqno) {
        return session.selectOne(namespace + "selectByPayment", p_pm_seqno);
    }

    @Override
    public int processPayment(PaymentDto dto) {
        return session.insert(namespace + "processPayment", dto);
    }
}
