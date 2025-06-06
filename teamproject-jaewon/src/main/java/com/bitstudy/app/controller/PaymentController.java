package com.bitstudy.app.controller;

import com.bitstudy.app.domain.PaymentMovieDto;
import com.bitstudy.app.domain.PaymentMusicalDto;
import com.bitstudy.app.domain.PaymentTheaterDto;
import com.bitstudy.app.service.PaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
public class PaymentController {

    @Autowired
    PaymentService paymentService;

    @CrossOrigin(origins = "*")
    @GetMapping("/paymentmovie")
    public List<PaymentMovieDto> selectAllMovie() {
        return paymentService.selectAllMovie();
    }

    @CrossOrigin(origins = "*")
    @GetMapping("/paymentmusical")
    public List<PaymentMusicalDto> selectAllMusical() {
        return paymentService.selectAllMusical();
    }

    @CrossOrigin(origins = "*")
    @GetMapping("/paymenttheater")
    public List<PaymentTheaterDto> selectAllTheater() {
        return paymentService.selectAllTheater();
    }
}
