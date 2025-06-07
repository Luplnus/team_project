package com.bitstudy.app.dao;

import com.bitstudy.app.domain.PaymentMethodDto;

import java.util.List;

public interface PaymentMethodDao {
    List<PaymentMethodDto> selectAll();

    int isCorrect(PaymentMethodDto dto);
}
