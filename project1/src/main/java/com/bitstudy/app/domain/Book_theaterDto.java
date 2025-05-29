package com.bitstudy.app.domain;

import java.sql.Timestamp;
import java.util.Date;

public class Book_theaterDto {
    private Integer b_seqno;
    private Integer b_user_seqno;
    private String t_id;
    private Integer s_id;
    private Date b_time;
    private Integer b_price;
    private Date b_theater_time;

    public Book_theaterDto() {
        this(0, "", 0, 15000);
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        this.b_time = timestamp;
    }

    public Book_theaterDto(Integer b_user_seqno, String t_id, Integer s_id, Integer b_price) {
        this.b_user_seqno = b_user_seqno;
        this.t_id = t_id;
        this.s_id = s_id;
        this.b_price = b_price;
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        this.b_time = timestamp;
    }

    public Integer getB_seqno() {
        return b_seqno;
    }

    public void setB_seqno(Integer b_seqno) {
        this.b_seqno = b_seqno;
    }

    public Integer getB_user_seqno() {
        return b_user_seqno;
    }

    public void setB_user_seqno(Integer b_user_seqno) {
        this.b_user_seqno = b_user_seqno;
    }

    public String getT_id() {
        return t_id;
    }

    public void setT_id(String t_id) {
        this.t_id = t_id;
    }

    public Integer getS_id() {
        return s_id;
    }

    public void setS_id(Integer s_id) {
        this.s_id = s_id;
    }

    public Date getB_time() {
        return b_time;
    }

    public void setB_time(Date b_time) {
        this.b_time = b_time;
    }

    public Integer getB_price() {
        return b_price;
    }

    public void setB_price(Integer b_price) {
        this.b_price = b_price;
    }

    public Date getB_theater_time() {
        return b_theater_time;
    }

    public void setB_theater_time(Date b_theater_time) {
        this.b_theater_time = b_theater_time;
    }

    @Override
    public String toString() {
        return "Book_tsicalDto{" +
                "b_seqno=" + b_seqno +
                ", b_user_seqno=" + b_user_seqno +
                ", t_id='" + t_id + '\'' +
                ", s_id=" + s_id +
                ", b_time=" + b_time +
                ", b_price=" + b_price +
                '}';
    }
}

