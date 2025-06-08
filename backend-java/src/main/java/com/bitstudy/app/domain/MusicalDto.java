package com.bitstudy.app.domain;

public class MusicalDto {
    private String mu_id; // 연극 id
    private String mu_title; // 연극 제목
    private String mu_prfpdfrom; // 시작 날짜
    private String mu_prfpdto; // 종료 날짜
    private String mu_venue; // 공연홀
    private String mu_poster; // 포스터 이미지 url
    private String mu_genre; // 뮤지컬 장르

    public MusicalDto() {
        this("", "", "", "", "", "", "");
    }

    public MusicalDto(String mu_id, String mu_title, String mu_prfpdfrom, String mu_prfpdto, String mu_venue, String mu_poster, String mu_genre) {
        this.mu_id = mu_id;
        this.mu_title = mu_title;
        this.mu_prfpdfrom = mu_prfpdfrom;
        this.mu_prfpdto = mu_prfpdto;
        this.mu_venue = mu_venue;
        this.mu_poster = mu_poster;
        this.mu_genre = mu_genre;
    }

    public String getMu_id() {
        return mu_id;
    }

    public void setMu_id(String mu_id) {
        this.mu_id = mu_id;
    }

    public String getMu_title() {
        return mu_title;
    }

    public void setMu_title(String mu_title) {
        this.mu_title = mu_title;
    }

    public String getMu_prfpdfrom() {
        return mu_prfpdfrom;
    }

    public void setMu_prfpdfrom(String mu_prfpdfrom) {
        this.mu_prfpdfrom = mu_prfpdfrom;
    }

    public String getMu_prfpdto() {
        return mu_prfpdto;
    }

    public void setMu_prfpdto(String mu_prfpdto) {
        this.mu_prfpdto = mu_prfpdto;
    }

    public String getMu_venue() {
        return mu_venue;
    }

    public void setMu_venue(String mu_venue) {
        this.mu_venue = mu_venue;
    }

    public String getMu_poster() {
        return mu_poster;
    }

    public void setMu_poster(String mu_poster) {
        this.mu_poster = mu_poster;
    }

    public String getMu_genre() {
        return mu_genre;
    }

    public void setMu_genre(String mu_genre) {
        this.mu_genre = mu_genre;
    }

    @Override
    public String toString() {
        return "MusicalDto{" +
                "mu_id='" + mu_id + '\'' +
                ", mu_title='" + mu_title + '\'' +
                ", mu_prfpdfrom='" + mu_prfpdfrom + '\'' +
                ", mu_prfpdto='" + mu_prfpdto + '\'' +
                ", mu_venue='" + mu_venue + '\'' +
                ", mu_poster='" + mu_poster + '\'' +
                ", mu_genre='" + mu_genre + '\'' +
                '}';
    }
}
