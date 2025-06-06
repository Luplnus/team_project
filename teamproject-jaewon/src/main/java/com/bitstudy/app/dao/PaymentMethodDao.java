package com.bitstudy.app.dao;

import com.bitstudy.app.domain.PaymentMethodDto;

import java.util.List;

public interface PaymentMethodDao {
    List<PaymentMethodDto> selectAll();

    int cardPayment(PaymentMethodDto dto);

    int accountPayment(PaymentMethodDto dto);

    int update(PaymentMethodDto dto);

    int isCorrect(PaymentMethodDto dto);
}
