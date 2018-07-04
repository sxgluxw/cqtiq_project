package com.cqtiq.pojo;

public class Txmqtt {
    private Integer id;

    private String devnum;

    private Integer port;

    private String data;

    private String sign;

    private Byte confirmed;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDevnum() {
        return devnum;
    }

    public void setDevnum(String devnum) {
        this.devnum = devnum == null ? null : devnum.trim();
    }

    public Integer getPort() {
        return port;
    }

    public void setPort(Integer port) {
        this.port = port;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data == null ? null : data.trim();
    }

    public String getSign() {
        return sign;
    }

    public void setSign(String sign) {
        this.sign = sign == null ? null : sign.trim();
    }

    public Byte getConfirmed() {
        return confirmed;
    }

    public void setConfirmed(Byte confirmed) {
        this.confirmed = confirmed;
    }
}