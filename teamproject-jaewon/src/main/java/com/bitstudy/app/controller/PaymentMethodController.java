package com.bitstudy.app.controller;

import com.bitstudy.app.domain.PaymentMethodDto;
import com.bitstudy.app.service.PaymentMethodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
public class PaymentMethodController {

    @Autowired
    PaymentMethodService paymentMethodService;

    @CrossOrigin(origins = "*")
    @GetMapping("/payments")
    public List<PaymentMethodDto> selectAll() { return paymentMethodService.selectAll(); }
}
