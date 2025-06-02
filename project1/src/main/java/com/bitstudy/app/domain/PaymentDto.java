package com.bitstudy.app.domain;

import java.sql.Date;

public class PaymentDto {
//    private int p_seqno;
    private int p_user_seqno;
    private int p_book_seqno;
    private int p_pm_seqno;
    private int p_price;
    private Date p_date;

    public PaymentDto() {
    }

    public PaymentDto(int p_user_seqno, int p_book_seqno, int p_pm_seqno, int p_price, Date p_date) {
        this.p_user_seqno = p_user_seqno;
        this.p_book_seqno = p_book_seqno;
        this.p_pm_seqno = p_pm_seqno;
        this.p_price = p_price;
        this.p_date = p_date;
    }

    public PaymentDto(int p_price, Date p_date) {
        this.p_price = p_price;
        this.p_date = p_date;
    }

//    public int getP_seqno() {
//        return p_seqno;
//    }
//
//    public void setP_seqno(int p_seqno) {
//        this.p_seqno = p_seqno;
//    }

    public int getP_user_seqno() {
        return p_user_seqno;
    }

    public void setP_user_seqno(int p_user_seqno) {
        this.p_user_seqno = p_user_seqno;
    }

    public int getP_book_seqno() {
        return p_book_seqno;
    }

    public void setP_book_seqno(int p_book_seqno) {
        this.p_book_seqno = p_book_seqno;
    }

    public int getP_pm_seqno() {
        return p_pm_seqno;
    }

    public void setP_pm_seqno(int p_pm_seqno) {
        this.p_pm_seqno = p_pm_seqno;
    }

    public int getP_price() {
        return p_price;
    }

    public void setP_price(int p_price) {
        this.p_price = p_price;
    }

    public Date getP_date() {
        return p_date;
    }

    public void setP_date(Date p_date) {
        this.p_date = p_date;
    }

    @Override
    public String toString() {
        return "PaymentDto{" +
//                "p_seqno=" + p_seqno +
                ", p_user_seqno=" + p_user_seqno +
                ", p_book_seqno=" + p_book_seqno +
                ", p_pm_seqno=" + p_pm_seqno +
                ", p_price=" + p_price +
                ", p_date=" + p_date +
                '}';
    }
}
