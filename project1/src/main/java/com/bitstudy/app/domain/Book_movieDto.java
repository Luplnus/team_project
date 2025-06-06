package com.bitstudy.app.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.sql.Timestamp;
import java.util.Date;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Book_movieDto {
    private Integer b_seqno;
    private Integer b_user_seqno;
    private String m_code;
    private Integer s_id;
    private Date b_time;
    private Integer b_price = 15000;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
    private Date b_movie_time;

    public Book_movieDto() {
        this.b_price = 15000;
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        this.b_time = timestamp;
    }

    public Book_movieDto(Integer b_user_seqno, String m_code, Integer s_id, Integer b_price) {
        this.b_user_seqno = b_user_seqno;
        this.m_code = m_code;
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

    public String getM_code() {
        return m_code;
    }

    public void setM_code(String m_code) {
        this.m_code = m_code;
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

    public Date getB_muvie_time() {
        return b_movie_time;
    }

    public void setB_muvie_time(Date b_muvie_time) {
        this.b_movie_time = b_muvie_time;
    }

    @Override
    public String toString() {
        return "Book_musicalDto{" +
                "b_seqno=" + b_seqno +
                ", b_user_seqno=" + b_user_seqno +
                ", m_code='" + m_code + '\'' +
                ", s_id=" + s_id +
                ", b_time=" + b_time +
                ", b_price=" + b_price +
                '}';
    }
}

