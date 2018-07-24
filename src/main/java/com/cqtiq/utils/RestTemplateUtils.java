package com.cqtiq.utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class RestTemplateUtils {
	private String serviceUrl = "http://192.168.31.174:8080";
	
	@Bean
	public RestTemplate restTemplate() {
		return new RestTemplate();
	}

	public String getServiceUrl() {
		return serviceUrl;
	}

	public void setServiceUrl(String serviceUrl) {
		this.serviceUrl = serviceUrl;
	}
	
	
}
