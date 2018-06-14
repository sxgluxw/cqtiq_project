package com.cqtiq.pojo;

public class Gas {
    private Integer id;

    private String time;

    private Integer gasdata;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time == null ? null : time.trim();
    }

    public Integer getGasdata() {
        return gasdata;
    }

    public void setGasdata(Integer gasdata) {
        this.gasdata = gasdata;
    }
}