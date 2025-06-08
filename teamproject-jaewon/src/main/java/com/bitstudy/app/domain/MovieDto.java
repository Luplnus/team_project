package com.bitstudy.app.domain;

import java.util.Date;

public class MovieDto {
    private String m_movie_cd; // 영화 코드
    private String m_title; // 영화 제목
    private Date m_open_dt; // 영화 개봉일
    private int m_show_tm; // 영화 상영시간
    private String m_genre_nm; // 영화 장르명
    private float m_rating; // 영화 평점
    private String m_poster_url; // 영화 포스터 (url)

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
                ", m_movieCode='" + m_movie_cd + '\'' +
                ", m_title='" + m_title + '\'' +
                ", m_opendate=" + m_open_dt +
                ", m_showtime=" + m_show_tm +
                ", m_genre='" + m_genre_nm + '\'' +
                ", m_rating=" + m_rating +
                ", m_posterUrl='" + m_poster_url + '\'' +
                '}';
    }
}
