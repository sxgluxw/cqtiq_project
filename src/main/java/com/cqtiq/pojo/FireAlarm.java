package com.cqtiq.pojo;

/**
 * @author luxuanwang
 *
 */
public class FireAlarm {
	private int id;
	private String smokescope;
	private String time;
	private String  status;
	public FireAlarm() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FireAlarm(int id, String smokescope, String time, String status) {
		super();
		this.id = id;
		this.smokescope = smokescope;
		this.time = time;
		this.status = status;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSmokescope() {
		return smokescope;
	}
	public void setSmokescope(String smokescope) {
		this.smokescope = smokescope;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "FireAlarm [id=" + id + ", smokescope=" + smokescope + ", time=" + time + ", status=" + status + "]";
	}

	
}
