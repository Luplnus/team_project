package com.bitstudy.app.domain;

public class RecentlistDto {
    private String rc_contentType;
    private String rc_id;
    private String rc_title;
    private String rc_poster_url;
    private String rc_genre;
    private String rc_payed_time;

    public RecentlistDto() {
    }

    public RecentlistDto(String rc_contentType, String rc_id, String rc_title, String rc_poster_url, String rc_genre, String rc_payed_time) {
        this.rc_contentType = rc_contentType;
        this.rc_id = rc_id;
        this.rc_title = rc_title;
        this.rc_poster_url = rc_poster_url;
        this.rc_genre = rc_genre;
        this.rc_payed_time = rc_payed_time;
    }

    public String getRc_contentType() {
        return rc_contentType;
    }

    public void setRc_contentType(String rc_contentType) {
        this.rc_contentType = rc_contentType;
    }

    public String getRc_id() {
        return rc_id;
    }

    public void setRc_id(String rc_id) {
        this.rc_id = rc_id;
    }

    public String getRc_title() {
        return rc_title;
    }

    public void setRc_title(String rc_title) {
        this.rc_title = rc_title;
    }

    public String getRc_poster_url() {
        return rc_poster_url;
    }

    public void setRc_poster_url(String rc_poster_url) {
        this.rc_poster_url = rc_poster_url;
    }

    public String getRc_genre() {
        return rc_genre;
    }

    public void setRc_genre(String rc_genre) {
        this.rc_genre = rc_genre;
    }

    public String getRc_payed_time() {
        return rc_payed_time;
    }

    public void getRc_payed_time(String rc_payed_time) {
        this.rc_payed_time = rc_payed_time;
    }

    @Override
    public String toString() {
        return "RecentlistDto{" +
                "rc_contentType='" + rc_contentType + '\'' +
                ", rc_id=" + rc_id +
                ", rc_title='" + rc_title + '\'' +
                ", rc_poster_url='" + rc_poster_url + '\'' +
                ", rc_genre='" + rc_genre + '\'' +
                ", rc_payed_time=" + rc_payed_time +
                '}';
    }
}