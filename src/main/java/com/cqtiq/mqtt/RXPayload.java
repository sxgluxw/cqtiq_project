package com.cqtiq.mqtt;

import com.cqtiq.mqtt.Ishadow;;

public class RXPayload extends Ishadow {
	public int id;
	public String devNum;
	public String time;
	public int port;
	public String data;
	public int gatewayCount;
	public String getawayId;
	public int loseCount;

	public RXPayload(int id, String devNum, String time, int port, String data, int gatewayCount, String getawayId,
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

	public RXPayload() {
		
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
		return "RXPayload [id=" + id + ", devNum=" + devNum + ", time=" + time + ", port=" + port + ", data=" + data
				+ ", gatewayCount=" + gatewayCount + ", getawayId=" + getawayId + ", loseCount=" + loseCount + "]";
	}

	/**
	 * @param sKey
	 *            秘钥
	 */
	public void tell(String sKey) {
		System.out.println("终端设备统一编号" + this.devNum);
		System.out.println("消息源端口" + this.port);
		System.out.println("消息原始内容" + this.data);
		try {
			System.out.println("解密内容" + this.Decrypt(this.data, sKey).toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
