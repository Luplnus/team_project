package com.bitstudy.app.domain;

import java.util.Date;

public class MovieDto {
    private int m_seqno;
    private String m_movie_cd;
    private String m_title;
    private Date m_open_dt;
    private int m_show_tm;
    private String m_genre_nm;
    private float m_rating;
    private String m_poster_url;

    public MovieDto() {
    }

    public MovieDto(String m_movie_cd, String m_title, int m_show_tm, String m_genre_nm, float m_rating, String m_poster_url) {
        this.m_movie_cd = m_movie_cd;
        this.m_title = m_title;
        this.m_show_tm = m_show_tm;
        this.m_genre_nm = m_genre_nm;
        this.m_rating = m_rating;
        this.m_poster_url = m_poster_url;
    }

    public MovieDto(String m_movie_cd, String m_title, Date m_open_dt, int m_show_tm, String m_genre_nm, float m_rating, String m_poster_url) {
        this.m_movie_cd = m_movie_cd;
        this.m_title = m_title;
        this.m_open_dt = m_open_dt;
        this.m_show_tm = m_show_tm;
        this.m_genre_nm = m_genre_nm;
        this.m_rating = m_rating;
        this.m_poster_url = m_poster_url;
    }

    public int getM_seqno() {
        return m_seqno;
    }

    public void setM_seqno(int m_seqno) {
        this.m_seqno = m_seqno;
    }

    public String getM_movie_cd() {
        return m_movie_cd;
    }

    public void setM_movie_cd(String m_movie_cd) {
        this.m_movie_cd = m_movie_cd;
    }

    public String getM_title() {
        return m_title;
    }

    public void setM_title(String m_title) {
        this.m_title = m_title;
    }

    public Date getM_open_dt() {
        return m_open_dt;
    }

    public void setM_open_dt(Date m_open_dt) {
        this.m_open_dt = m_open_dt;
    }

    public int getM_show_tm() {
        return m_show_tm;
    }

    public void setM_show_tm(int m_show_tm) {
        this.m_show_tm = m_show_tm;
    }

    public String getM_genre_nm() {
        return m_genre_nm;
    }

    public void setM_genre_nm(String m_genre_nm) {
        this.m_genre_nm = m_genre_nm;
    }

    public float getM_rating() {
        return m_rating;
    }

    public void setM_rating(float m_rating) {
        this.m_rating = m_rating;
    }

    public String getM_poster_url() {
        return m_poster_url;
    }

    public void setM_poster_url(String m_poster_url) {
        this.m_poster_url = m_poster_url;
    }

    @Override
    public String toString() {
        return "MovieDto{" +
//                "m_seqno=" + m_seqno +
                ", m_movie_cd='" + m_movie_cd + '\'' +
                ", m_title='" + m_title + '\'' +
                ", m_opendate=" + m_open_dt +
                ", m_showtime=" + m_show_tm +
                ", m_genre='" + m_genre_nm + '\'' +
                ", m_rating=" + m_rating +
                ", m_posterUrl='" + m_poster_url + '\'' +
                '}';
    }
}
