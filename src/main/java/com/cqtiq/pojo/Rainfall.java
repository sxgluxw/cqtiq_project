package com.cqtiq.pojo;

public class Rainfall {
    private Integer id;

    private String freshet;

    private String rainfall;

    private String time;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFreshet() {
        return freshet;
    }

    public void setFreshet(String freshet) {
        this.freshet = freshet == null ? null : freshet.trim();
    }

    public String getRainfall() {
        return rainfall;
    }

    public void setRainfall(String rainfall) {
        this.rainfall = rainfall == null ? null : rainfall.trim();
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time == null ? null : time.trim();
    }
}