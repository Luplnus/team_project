package com.bitstudy.app.domain;

public class Venue_theaterDto {
    private Integer vt_seqno;
    private Integer vt_b_seqno;
    private String vt_name;

    public Venue_theaterDto() {
    }

    public Integer getVm_seqno() {
        return vt_seqno;
    }

    public void setVm_seqno(Integer vt_seqno) {
        this.vt_seqno = vt_seqno;
    }

    public Integer getVm_b_seqno() {
        return vt_b_seqno;
    }

    public void setVm_b_seqno(Integer vt_b_seqno) {
        this.vt_b_seqno = vt_b_seqno;
    }

    public String getVm_name() {
        return vt_name;
    }

    public void setVm_name(String vt_name) {
        this.vt_name = vt_name;
    }

    @Override
    public String toString() {
        return "Venue_movieDto{" +
                "vt_seqno=" + vt_seqno +
                ", vt_b_seqno=" + vt_b_seqno +
                ", vt_name='" + vt_name + '\'' +
                '}';
    }
}
