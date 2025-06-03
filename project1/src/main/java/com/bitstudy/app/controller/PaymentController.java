package com.bitstudy.app.controller;

import com.bitstudy.app.domain.PaymentMethodDto;
import com.bitstudy.app.service.PaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("/api")
public class PaymentController {
    @Autowired
    PaymentService paymentService;

    @CrossOrigin(origins = "*")
    @GetMapping("/payments")
    public List<PaymentMethodDto> selectAll() { return paymentService.selectAll(); }
}
