package com.bitstudy.app.domain;

public class UserDto {
    private int u_seqno;
    private String u_id;
    private String u_pw;
    private String u_name;
    private String u_email;
    private String u_address;
    private String u_cellnum;

    public UserDto() {
    }

    public UserDto(String u_id, String u_pw, String u_name, String u_email, String u_address, String u_cellnum) {
        this.u_id = u_id;
        this.u_pw = u_pw;
        this.u_name = u_name;
        this.u_email = u_email;
        this.u_address = u_address;
        this.u_cellnum = u_cellnum;
    }

    public UserDto(int u_seqno, String u_id, String u_pw, String u_name, String u_email, String u_address, String u_cellnum) {
        this.u_seqno = u_seqno;
        this.u_id = u_id;
        this.u_pw = u_pw;
        this.u_name = u_name;
        this.u_email = u_email;
        this.u_address = u_address;
        this.u_cellnum = u_cellnum;
    }

    public int getU_seqno() { return u_seqno; }
    public void setU_seqno(int u_seqno){ this.u_seqno = u_seqno; }
    public String getU_id() {
        return u_id;
    }
    public void setU_id(String u_id) {
        this.u_id = u_id;
    }
    public String getU_pw() {
        return u_pw;
    }
    public void setU_pw(String u_pw) {
        this.u_pw = u_pw;
    }
    public String getU_name() {
        return u_name;
    }
    public void setU_name(String u_name) {
        this.u_name = u_name;
    }
    public String getU_email() {
        return u_email;
    }
    public void setU_email(String u_email) {
        this.u_email = u_email;
    }
    public String getU_address() {
        return u_address;
    }
    public void setU_address(String u_address) {
        this.u_address = u_address;
    }
    public String getU_cellnum() {
        return u_cellnum;
    }
    public void setU_cellnum(String u_cellnum) {
        this.u_cellnum = u_cellnum;
    }

    @Override
    public String toString() {
        return "UserDto{" +
                "u_seqno=" + u_seqno +
                ", u_id='" + u_id + '\'' +
                ", u_pw='" + u_pw + '\'' +
                ", u_name='" + u_name + '\'' +
                ", u_email='" + u_email + '\'' +
                ", u_address='" + u_address + '\'' +
                ", u_cellnum='" + u_cellnum + '\'' +
                '}';
    }
}