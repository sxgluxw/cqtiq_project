package com.cqtiq.pojo;

public class Bardata {
  
	private Integer id;

    private String y;

    private Integer a;

    private Integer b;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getY() {
        return y;
    }

    public void setY(String y) {
        this.y = y == null ? null : y.trim();
    }

    public Integer getA() {
        return a;
    }

    public void setA(Integer a) {
        this.a = a;
    }

    public Integer getB() {
        return b;
    }

    public void setB(Integer b) {
        this.b = b;
    }
    
    
    @Override
  	public String toString() {
  		return "Bardata [id=" + id + ", y=" + y + ", a=" + a + ", b=" + b + "]";
  	}

}