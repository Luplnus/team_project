package com.bitstudy.app.domain;

public class Venue_musicalDto {
    private Integer vmu_seqno;
    private Integer vmu_b_seqno;
    private String vmu_name;

    public Venue_musicalDto() {
    }

    public Integer getVm_seqno() {
        return vmu_seqno;
    }

    public void setVm_seqno(Integer vmu_seqno) {
        this.vmu_seqno = vmu_seqno;
    }

    public Integer getVm_b_seqno() {
        return vmu_b_seqno;
    }

    public void setVm_b_seqno(Integer vmu_b_seqno) {
        this.vmu_b_seqno = vmu_b_seqno;
    }

    public String getVm_name() {
        return vmu_name;
    }

    public void setVm_name(String vmu_name) {
        this.vmu_name = vmu_name;
    }

    @Override
    public String toString() {
        return "Venue_movieDto{" +
                "vmu_seqno=" + vmu_seqno +
                ", vmu_b_seqno=" + vmu_b_seqno +
                ", vmu_name='" + vmu_name + '\'' +
                '}';
    }
}
