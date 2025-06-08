package com.bitstudy.app.domain;

public class Seat_movieDto {
    private Integer s_id;
    private String m_code;
    private String s_label;
    private boolean s_is_available;

    public Seat_movieDto() {
    }

    public Integer getS_id() {
        return s_id;
    }

    public void setS_id(Integer s_id) {
        this.s_id = s_id;
    }

    public String getM_code() {
        return m_code;
    }

    public void setM_code(String m_code) {
        this.m_code = m_code;
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
        return "Seat_movieDto{" +
                "s_id=" + s_id +
                ", m_code='" + m_code + '\'' +
                ", s_label='" + s_label + '\'' +
                ", s_is_available=" + s_is_available +
                '}';
    }
}
