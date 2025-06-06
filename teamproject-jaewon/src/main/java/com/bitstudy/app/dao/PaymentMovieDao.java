package com.bitstudy.app.dao;

import com.bitstudy.app.domain.PaymentMovieDto;

import java.util.List;

public interface PaymentMovieDao {
    List<PaymentMovieDto> selectAllMovie();
}
