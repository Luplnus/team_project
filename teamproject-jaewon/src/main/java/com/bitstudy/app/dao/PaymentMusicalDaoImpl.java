package com.bitstudy.app.dao;

import com.bitstudy.app.domain.PaymentMusicalDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PaymentMusicalDaoImpl implements PaymentMusicalDao {

    @Autowired
    private SqlSession session;

    private String namespace = "com.bitstudy.app.dao.paymentMusicalMapper.";

    @Override
    public List<PaymentMusicalDto> selectAllMusical() {
        return session.selectList(namespace + "selectAllMusical");
    }

    @Override
    public int insert(PaymentMusicalDto paymentMusicalDto) { // 뮤지컬 결제 정보 저장
        return session.insert(namespace + "insert", paymentMusicalDto);
    }
}
