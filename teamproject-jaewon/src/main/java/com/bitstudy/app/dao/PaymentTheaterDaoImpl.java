package com.bitstudy.app.dao;

import com.bitstudy.app.domain.PaymentTheaterDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PaymentTheaterDaoImpl implements PaymentTheaterDao {

    @Autowired
    private SqlSession session;

    private String namespace = "com.bitstudy.app.dao.paymentTheaterMapper.";

    @Override
    public List<PaymentTheaterDto> selectAllTheater() {
        return session.selectList(namespace + "selectAllTheater");
    }

    @Override
    public int insert(PaymentTheaterDto paymentTheaterDto) { // 연극 결제 정보 저장
        return session.insert(namespace + "insert", paymentTheaterDto);
    }
}
