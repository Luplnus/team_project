package com.bitstudy.app.service;

import com.bitstudy.app.domain.PaymentMethodDto;

import java.util.List;

public interface PaymentMethodService {
    List<PaymentMethodDto> selectAll();

    int isCorrect(PaymentMethodDto dto);
}
