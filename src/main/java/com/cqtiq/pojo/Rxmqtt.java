package com.cqtiq.pojo;

import java.io.Serializable;

public class Rxmqtt implements Serializable{
	private int id;

	private String devNum;

	private String time;

	private int port;

	private String data;

	private int gatewayCount;

	private String getawayId;

	private int loseCount;

	public Rxmqtt(int id, String devNum, String time, int port, String data, int gatewayCount, String getawayId,
			int loseCount) {
		super();
		this.id = id;
		this.devNum = devNum;
		this.time = time;
		this.port = port;
		this.data = data;
		this.gatewayCount = gatewayCount;
		this.getawayId = getawayId;
		this.loseCount = loseCount;
	}

	public Rxmqtt() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDevNum() {
		return devNum;
	}

	public void setDevNum(String devNum) {
		this.devNum = devNum;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public int getPort() {
		return port;
	}

	public void setPort(int port) {
		this.port = port;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public int getGatewayCount() {
		return gatewayCount;
	}

	public void setGatewayCount(int gatewayCount) {
		this.gatewayCount = gatewayCount;
	}

	public String getGetawayId() {
		return getawayId;
	}

	public void setGetawayId(String getawayId) {
		this.getawayId = getawayId;
	}

	public int getLoseCount() {
		return loseCount;
	}

	public void setLoseCount(int loseCount) {
		this.loseCount = loseCount;
	}

	@Override
	public String toString() {
		return "Rxmqtt [id=" + id + ", devNum=" + devNum + ", time=" + time + ", port=" + port + ", data=" + data
				+ ", gatewayCount=" + gatewayCount + ", getawayId=" + getawayId + ", loseCount=" + loseCount + "]";
	}

}