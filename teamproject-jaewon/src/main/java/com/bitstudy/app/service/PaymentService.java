package com.bitstudy.app.service;

import com.bitstudy.app.domain.PaymentMovieDto;
import com.bitstudy.app.domain.PaymentMusicalDto;
import com.bitstudy.app.domain.PaymentTheaterDto;

import java.util.List;

public interface PaymentService {

    List<PaymentMovieDto> selectAllMovie();

    List<PaymentMusicalDto> selectAllMusical();

    List<PaymentTheaterDto> selectAllTheater();
}
