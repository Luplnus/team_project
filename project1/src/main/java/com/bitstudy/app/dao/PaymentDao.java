package com.bitstudy.app.dao;

import com.bitstudy.app.domain.PaymentDto;

public interface PaymentDao {
//    List<PaymentDto> selectAll();

    PaymentDto selectByPmId(int p_seqno);

    PaymentDto selectByUserId(int p_user_seqno);

    PaymentDto selectByBookId(int p_book_seqno);

    PaymentDto selectByPayment(int p_pm_seqno);

    int processPayment(PaymentDto dto);
}
