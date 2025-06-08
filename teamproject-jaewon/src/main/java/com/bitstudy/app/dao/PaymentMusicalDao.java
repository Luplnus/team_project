package com.bitstudy.app.dao;

import com.bitstudy.app.domain.PaymentMusicalDto;

import java.util.List;

public interface PaymentMusicalDao {
    List<PaymentMusicalDto> selectAllMusical();
    int insert(PaymentMusicalDto paymentMusicalDto);
}
