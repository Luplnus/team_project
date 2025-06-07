package com.bitstudy.app.domain;

public class Seat_theaterDto {
    private Integer s_id;
    private String t_id;
    private String s_label;
    private boolean s_is_available;

    public Seat_theaterDto() {
    }

    public Integer getS_id() {
        return s_id;
    }

    public void setS_id(Integer s_id) {
        this.s_id = s_id;
    }

    public String getT_id() {
        return t_id;
    }

    public void setT_id(String t_id) {
        this.t_id = t_id;
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
        return "Seat_theaterDto{" +
                "s_id=" + s_id +
                ", t_id='" + t_id + '\'' +
                ", s_label='" + s_label + '\'' +
                ", s_is_available=" + s_is_available +
                '}';
    }
}
