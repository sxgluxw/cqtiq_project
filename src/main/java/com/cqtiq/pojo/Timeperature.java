package com.cqtiq.pojo;

public class Timeperature {
    private Integer id;

    private String timeperature;

    private String time;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTimeperature() {
        return timeperature;
    }

    public void setTimeperature(String timeperature) {
        this.timeperature = timeperature == null ? null : timeperature.trim();
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time == null ? null : time.trim();
    }

	@Override
	public String toString() {
		return "Timeperature [id=" + id + ", timeperature=" + timeperature + ", time=" + time + "]";
	}
    
    
}