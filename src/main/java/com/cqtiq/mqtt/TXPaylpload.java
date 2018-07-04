package com.cqtiq.mqtt;

import java.util.HashMap;
import com.google.gson.Gson;

public class TXPaylpload extends Ishadow {
	public int id;
	public String devNum;
	public int port;
	public String data;
	public String sign;
	public boolean confirmed;

	public TXPaylpload(int id, String devNum, int port, String data, String sign, boolean confirmed) {
		super();
		this.id = id;
		this.devNum = devNum;
		this.port = port;
		this.data = data;
		this.sign = sign;
		this.confirmed = confirmed;
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

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	public boolean isConfirmed() {
		return confirmed;
	}

	public void setConfirmed(boolean confirmed) {
		this.confirmed = confirmed;
	}

	/**
	 * @param sKey
	 *            秘钥
	 * @return 包装通信层消息
	 */
	public byte[] getBytes(String sKey) {
		HashMap map = new HashMap();
		map.put("reference", this.sign);
		map.put("confirmed", this.confirmed);
		map.put("devEUI", this.devNum);
		map.put("fPort", this.port);
		try {
			String s = this.Encrypt(this.data, sKey);
			map.put("data", s);
			System.out.println("[" + this.Decrypt(s, sKey) + "]");
		} catch (Exception e) {
			e.printStackTrace();
		}
		Gson g = new Gson();
		return g.toJson(map).getBytes();
	}

}
