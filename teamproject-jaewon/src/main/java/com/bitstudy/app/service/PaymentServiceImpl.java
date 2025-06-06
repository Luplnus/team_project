package com.bitstudy.app.service;

import com.bitstudy.app.dao.PaymentMovieDao;
import com.bitstudy.app.dao.PaymentMusicalDao;
import com.bitstudy.app.dao.PaymentTheaterDao;
import com.bitstudy.app.domain.PaymentMovieDto;
import com.bitstudy.app.domain.PaymentMusicalDto;
import com.bitstudy.app.domain.PaymentTheaterDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PaymentServiceImpl implements PaymentService {

    @Autowired
    private PaymentMovieDao paymentMovieDao;

    @Autowired
    private PaymentMusicalDao paymentMusicalDao;

    @Autowired
    private PaymentTheaterDao paymentTheaterDao;

    @Override
    public List<PaymentMovieDto> selectAllMovie() {
        return paymentMovieDao.selectAllMovie();
    }

    public List<PaymentMusicalDto> selectAllMusical() {
        return paymentMusicalDao.selectAllMusical();
    }

    @Override
    public List<PaymentTheaterDto> selectAllTheater() {
        return paymentTheaterDao.selectAllTheater();
    }

//    public PaymentMovieDto savePayment(PaymentMovieDto paymentMovieDto) {
//        try {
//            int pm_seqno=
//        }
//    }
}
