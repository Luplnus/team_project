package com.bitstudy.app.service;

import com.bitstudy.app.dao.PaymentDao;
import com.bitstudy.app.dao.PaymentMethodDao;
import com.bitstudy.app.dao.PaymentMethodDaoImpl;
import com.bitstudy.app.domain.PaymentDto;
import com.bitstudy.app.domain.PaymentMethodDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PaymentServiceImpl implements PaymentService {

    @Autowired
    private PaymentDao paymentDao;

    @Autowired
    private PaymentMethodDao paymentMethodDao;

    @Override
    public List<PaymentMethodDto> selectAll() {
        return paymentMethodDao.selectAll();
    }

    @Override
    public PaymentDto getPaymentByPmId(int p_seqno) {
        return paymentDao.selectByPmId(p_seqno);
    }

    @Override
    public PaymentDto getPaymentByUserId(int p_user_seqno) {
        return paymentDao.selectByUserId(p_user_seqno);
    }

    @Override
    public PaymentDto getPaymentByBookId(int p_book_seqno) {
        return paymentDao.selectByBookId(p_book_seqno);
    }

    @Override
    public PaymentDto getPaymentMethod(int p_pm_seqno) {
        return paymentDao.selectByPayment(p_pm_seqno);
    }

    @Override
    public int processPayment(PaymentDto dto) {
        return paymentDao.processPayment(dto);
    }

    @Override
    public int processCardPayment(PaymentMethodDto dto) {
        return paymentMethodDao.cardPayment(dto);
    }

    @Override
    public int processAccountPayment(PaymentMethodDto dto) {
        return paymentMethodDao.accountPayment(dto);
    }

    @Override
    public int updatePaymentMethod(PaymentMethodDto dto) {
        return paymentMethodDao.update(dto);
    }
}
