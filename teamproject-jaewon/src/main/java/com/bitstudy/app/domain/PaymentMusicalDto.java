package com.bitstudy.app.domain;

import java.sql.Date;

public class PaymentMusicalDto { // 시퀀스넘버로 정보 받기
    private int p_seqno; // 결제 시퀀스넘버 PK
    private int b_seqno; // 예매 시퀀스넘버 FK
    private int u_seqno; // 유저 시퀀서넘버 FK
    private int pm_seqno; // 결제방식(카드) 시퀀스넘버
    private int p_price; // 결제 가격
    private Date p_date; // 결제시 시간

    public PaymentMusicalDto() {
    }

    public PaymentMusicalDto(int p_seqno, int b_seqno, int u_seqno, int pm_seqno, int p_price, Date p_date) {
        this.p_seqno = p_seqno;
        this.b_seqno = b_seqno;
        this.u_seqno = u_seqno;
        this.pm_seqno = pm_seqno;
        this.p_price = p_price;
        this.p_date = p_date;
    }

    public int getP_seqno() {
        return p_seqno;
    }

    public void setP_seqno(int p_seqno) {
        this.p_seqno = p_seqno;
    }

    public int getB_seqno() {
        return b_seqno;
    }

    public void setB_seqno(int b_seqno) {
        this.b_seqno = b_seqno;
    }

    public int getU_seqno() {
        return u_seqno;
    }

    public void setU_seqno(int u_seqno) {
        this.u_seqno = u_seqno;
    }

    public int getPm_seqno() {
        return pm_seqno;
    }

    public void setPm_seqno(int pm_seqno) {
        this.pm_seqno = pm_seqno;
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
        return "PaymentMusicalDto{" +
                "p_seqno=" + p_seqno +
                ", b_seqno=" + b_seqno +
                ", u_seqno=" + u_seqno +
                ", pm_seqno=" + pm_seqno +
                ", p_price=" + p_price +
                ", p_date=" + p_date +
                '}';
    }
}
