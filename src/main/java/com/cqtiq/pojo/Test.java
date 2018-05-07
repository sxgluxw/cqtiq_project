package com.cqtiq.pojo;

public class Test {
    private Integer id;

    private String onoff;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOnoff() {
        return onoff;
    }

    public void setOnoff(String onoff) {
        this.onoff = onoff == null ? null : onoff.trim();
    }

	@Override
	public String toString() {
		return "Test [id=" + id + ", onoff=" + onoff + "]";
	}
    
    
}