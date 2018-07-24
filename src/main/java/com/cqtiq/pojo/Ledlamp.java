package com.cqtiq.pojo;

import java.util.Date;

import org.springframework.http.HttpMethod;

import com.cqtiq.utils.RestTemplateUtils;

public class Ledlamp {
    private Integer id;

    private String devnum;

    private Date time;

    private Integer port;

    private String data;

    private Integer gatewaycount;

    private String gatewayid;

    private Integer losecount;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDevnum() {
        return devnum;
    }

    public void setDevnum(String devnum) {
        this.devnum = devnum == null ? null : devnum.trim();
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Integer getPort() {
        return port;
    }

    public void setPort(Integer port) {
        this.port = port;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data == null ? null : data.trim();
    }

    public Integer getGatewaycount() {
        return gatewaycount;
    }

    public void setGatewaycount(Integer gatewaycount) {
        this.gatewaycount = gatewaycount;
    }

    public String getGatewayid() {
        return gatewayid;
    }

    public void setGatewayid(String gatewayid) {
        this.gatewayid = gatewayid == null ? null : gatewayid.trim();
    }

    public Integer getLosecount() {
        return losecount;
    }

    public void setLosecount(Integer losecount) {
        this.losecount = losecount;
    }

	@Override
	public String toString() {
		return "Ledlamp [id=" + id + ", devnum=" + devnum + ", time=" + time + ", port=" + port + ", data=" + data
				+ ", gatewaycount=" + gatewaycount + ", gatewayid=" + gatewayid + ", losecount=" + losecount + "]";
	}
    
	
	public void save (RestTemplateUtils templateUtils) {
		try {
			
			templateUtils.restTemplate().exchange(templateUtils.getServiceUrl()+ "/ledlamp/"+this.getDevnum()+"/"+this.getData()+"/"+this.getTime(),  HttpMethod.GET,null,String.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
    
}