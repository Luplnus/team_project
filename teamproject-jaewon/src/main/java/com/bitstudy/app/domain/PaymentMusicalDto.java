package com.bitstudy.app.domain;

import java.sql.Date;

public class PaymentMusicalDto {
    private int p_seqno;
    private int b_seqno;
    private int u_seqno;
    private int pm_seqno;
    private int price;
    private Date p_date;

    public PaymentMusicalDto() {
    }

    public PaymentMusicalDto(int p_seqno, int b_seqno, int u_seqno, int pm_seqno, int price, Date p_date) {
        this.p_seqno = p_seqno;
        this.b_seqno = b_seqno;
        this.u_seqno = u_seqno;
        this.pm_seqno = pm_seqno;
        this.price = price;
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

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
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
                ", price=" + price +
                ", p_date=" + p_date +
                '}';
    }
}
