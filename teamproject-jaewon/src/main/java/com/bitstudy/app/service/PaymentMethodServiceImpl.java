package com.bitstudy.app.service;

import com.bitstudy.app.dao.PaymentMethodDao;
import com.bitstudy.app.domain.PaymentMethodDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PaymentMethodServiceImpl implements PaymentMethodService {

    @Autowired
    private PaymentMethodDao paymentMethodDao;

    @Override
    public List<PaymentMethodDto> selectAll() {
        return paymentMethodDao.selectAll();
    }

    @Override
    public int isCorrect(PaymentMethodDto dto) {
        return paymentMethodDao.isCorrect(dto);
    }
}
