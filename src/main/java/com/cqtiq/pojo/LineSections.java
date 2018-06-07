package com.cqtiq.pojo;

public class LineSections {

	private Integer id;

    private String time;

    private Integer numdata;

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

    public Integer getNumdata() {
        return numdata;
    }

    public void setNumdata(Integer numdata) {
        this.numdata = numdata;
    }
    @Override
    public String toString() {
    	return "LineSections [id=" + id + ", time=" + time + ", numdata=" + numdata + "]";
    }
}