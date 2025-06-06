package com.bitstudy.app.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.sql.Timestamp;
import java.util.Date;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Book_musicalDto {
    private Integer b_seqno;
    private Integer b_user_seqno;
    private String mu_id;
    private Integer s_id;
    private Date b_time ;
    private Integer b_price = 15000;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
    private String b_musical_time;

    public Book_musicalDto() {
        this(0, "",15000);
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        this.b_time = timestamp;
    }

    public Book_musicalDto(Integer b_user_seqno, String mu_id, Integer b_price) {
        this.b_user_seqno = b_user_seqno;
        this.mu_id = mu_id;
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

    public String getMu_id() {
        return mu_id;
    }

    public void setMu_id(String mu_id) {
        this.mu_id = mu_id;
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

    public String getB_musical_time() {
        return b_musical_time;
    }

    public void setB_musical_time(String b_musical_time) {
        this.b_musical_time = b_musical_time;
    }

    @Override
    public String toString() {
        return "Book_musicalDto{" +
                "b_seqno=" + b_seqno +
                ", b_user_seqno=" + b_user_seqno +
                ", mu_id='" + mu_id + '\'' +
                ", s_id=" + s_id +
                ", b_time=" + b_time +
                ", b_price=" + b_price +
                '}';
    }
}

