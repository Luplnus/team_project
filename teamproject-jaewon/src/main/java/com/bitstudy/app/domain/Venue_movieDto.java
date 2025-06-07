package com.bitstudy.app.domain;

public class Venue_movieDto {
    private Integer vm_seqno;
    private Integer vm_b_seqno;
    private String vm_name;

    public Venue_movieDto() {
    }

    public Integer getVm_seqno() {
        return vm_seqno;
    }

    public void setVm_seqno(Integer vm_seqno) {
        this.vm_seqno = vm_seqno;
    }

    public Integer getVm_b_seqno() {
        return vm_b_seqno;
    }

    public void setVm_b_seqno(Integer vm_b_seqno) {
        this.vm_b_seqno = vm_b_seqno;
    }

    public String getVm_name() {
        return vm_name;
    }

    public void setVm_name(String vm_name) {
        this.vm_name = vm_name;
    }

    @Override
    public String toString() {
        return "Venue_movieDto{" +
                "vm_seqno=" + vm_seqno +
                ", vm_b_seqno=" + vm_b_seqno +
                ", vm_name='" + vm_name + '\'' +
                '}';
    }
}
