package com.bitstudy.app.service;

import com.bitstudy.app.domain.PaymentDto;
import com.bitstudy.app.domain.PaymentMethodDto;

import java.util.List;

public interface PaymentService {
    List<PaymentMethodDto> selectAll();

    PaymentDto getPaymentByPmId(int p_seqno);

    PaymentDto getPaymentByUserId(int p_user_seqno);

    PaymentDto getPaymentByBookId(int p_book_seqno);

    PaymentDto getPaymentMethod(int p_pm_seqno);

    int processPayment(PaymentDto dto);

    int processCardPayment(PaymentMethodDto dto);

    int processAccountPayment(PaymentMethodDto dto);

    int updatePaymentMethod(PaymentMethodDto dto);
}
