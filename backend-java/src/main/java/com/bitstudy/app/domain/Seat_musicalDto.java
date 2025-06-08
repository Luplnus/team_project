package com.bitstudy.app.domain;

public class Seat_musicalDto {
    private Integer s_id;
    private String mu_id;
    private String s_label;
    private boolean s_is_available;

    public Seat_musicalDto() {
    }

    public Integer getS_id() {
        return s_id;
    }

    public void setS_id(Integer s_id) {
        this.s_id = s_id;
    }

    public String getMu_id() {
        return mu_id;
    }

    public void setMu_id(String mu_id) {
        this.mu_id = mu_id;
    }

    public String getS_label() {
        return s_label;
    }

    public void setS_label(String s_label) {
        this.s_label = s_label;
    }

    public boolean isS_is_available() {
        return s_is_available;
    }

    public void setS_is_available(boolean s_is_available) {
        this.s_is_available = s_is_available;
    }

    @Override
    public String toString() {
        return "Seat_musicalDto{" +
                "s_id=" + s_id +
                ", mu_id='" + mu_id + '\'' +
                ", s_label='" + s_label + '\'' +
                ", s_is_available=" + s_is_available +
                '}';
    }
}
