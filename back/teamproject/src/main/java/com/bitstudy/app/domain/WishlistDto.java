package com.bitstudy.app.domain;

public class WishlistDto {
    private String w_contentType;
    private String w_id;
    private String w_title;
    private String w_poster_url;
    private String w_genre;
    private String w_start_date;

    public WishlistDto() {
    }

    public WishlistDto(String w_contentType, String w_id, String w_title, String w_poster_url, String w_genre, String w_start_date) {
        this.w_contentType = w_contentType;
        this.w_id = w_id;
        this.w_title = w_title;
        this.w_poster_url = w_poster_url;
        this.w_genre = w_genre;
        this.w_start_date = w_start_date;
    }

    public String getW_contentType() {
        return w_contentType;
    }

    public void setW_contentType(String w_contentType) {
        this.w_contentType = w_contentType;
    }

    public String getW_id() {
        return w_id;
    }

    public void setW_id(String w_id) {
        this.w_id = w_id;
    }

    public String getW_title() {
        return w_title;
    }

    public void setW_title(String w_title) {
        this.w_title = w_title;
    }

    public String getW_poster_url() {
        return w_poster_url;
    }

    public void setW_poster_url(String w_poster_url) {
        this.w_poster_url = w_poster_url;
    }

    public String getW_genre() {
        return w_genre;
    }

    public void setW_genre(String w_genre) {
        this.w_genre = w_genre;
    }

    public String getW_start_date() {
        return w_start_date;
    }

    public void setW_start_date(String w_start_date) {
        this.w_start_date = w_start_date;
    }

    @Override
    public String toString() {
        return "WishlistDto{" +
                "w_contentType='" + w_contentType + '\'' +
                ", w_id='" + w_id + '\'' +
                ", w_title='" + w_title + '\'' +
                ", w_poster_url='" + w_poster_url + '\'' +
                ", w_genre='" + w_genre + '\'' +
                ", w_start_date='" + w_start_date + '\'' +
                '}';
    }
}