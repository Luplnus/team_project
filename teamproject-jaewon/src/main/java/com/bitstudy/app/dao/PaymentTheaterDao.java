package com.bitstudy.app.dao;

import com.bitstudy.app.domain.PaymentTheaterDto;

import java.util.List;

public interface PaymentTheaterDao {
    List<PaymentTheaterDto> selectAllTheater();
    int insert(PaymentTheaterDto paymentTheaterDto);
}
