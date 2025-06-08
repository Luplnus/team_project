package com.bitstudy.app.domain;

public class PaymentMethodDto {
    private String pm_method; // 신용카드, 무통장입금, 간편결제 등 방식
    private String pm_bank; // 은행이름
    private String pm_cardno; // 카드번호
    private String pm_cardcvc; // 카드 cvc
    private String pm_cardvalid; // 카드 만료일
    private String pm_pw; // 카드 비밀번호 (앞 두자리)


    public PaymentMethodDto() {
    }

    public PaymentMethodDto(String pm_bank, String pm_cardno, String pm_cardcvc, String pm_cardvalid, String pm_pw) {
        this.pm_bank = pm_bank;
        this.pm_cardno = pm_cardno;
        this.pm_cardcvc = pm_cardcvc;
        this.pm_cardvalid = pm_cardvalid;
        this.pm_pw = pm_pw;
    }

    public PaymentMethodDto(String pm_method, String pm_bank, String pm_cardno, String pm_cardcvc, String pm_cardvalid, String pm_pw) {
        this.pm_method = pm_method;
        this.pm_bank = pm_bank;
        this.pm_cardno = pm_cardno;
        this.pm_cardcvc = pm_cardcvc;
        this.pm_cardvalid = pm_cardvalid;
        this.pm_pw = pm_pw;
    }

    public String getPm_method() {
        return pm_method;
    }

    public void setPm_method(String pm_method) {
        this.pm_method = pm_method;
    }

    public String getPm_bank() {
        return pm_bank;
    }

    public void setPm_bank(String pm_bank) {
        this.pm_bank = pm_bank;
    }

    public String getPm_cardno() {
        return pm_cardno;
    }

    public void setPm_cardno(String pm_cardno) {
        this.pm_cardno = pm_cardno;
    }

    public String getPm_cardcvc() {
        return pm_cardcvc;
    }

    public void setPm_cardcvc(String pm_cardcvc) {
        this.pm_cardcvc = pm_cardcvc;
    }

    public String getPm_cardvalid() {
        return pm_cardvalid;
    }

    public void setPm_cardvalid(String pm_cardvalid) {
        this.pm_cardvalid = pm_cardvalid;
    }

    public String getPm_pw() {
        return pm_pw;
    }

    public void setPm_pw(String pm_pw) {
        this.pm_pw = pm_pw;
    }

    @Override
    public String toString() {
        return "PaymentMethodDto{" +
                "pm_method='" + pm_method + '\'' +
                ", pm_bank='" + pm_bank + '\'' +
                ", pm_cardno='" + pm_cardno + '\'' +
                ", pm_cardcvc='" + pm_cardcvc + '\'' +
                ", pm_cardvalid='" + pm_cardvalid + '\'' +
                ", pm_pw='" + pm_pw + '\'' +
                '}';
    }
}
