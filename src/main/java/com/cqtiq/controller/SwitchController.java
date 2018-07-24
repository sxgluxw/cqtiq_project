package com.cqtiq.controller;

import javax.servlet.http.HttpServletRequest;

import org.eclipse.paho.client.mqttv3.MqttException;
import org.eclipse.paho.client.mqttv3.MqttMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.cqtiq.mqtt.Server;
import com.cqtiq.pojo.Test;
import com.cqtiq.service.SwitchService;

@Controller
public class SwitchController {
	
	@Autowired
	private SwitchService switchService;
	
//	@Autowired
//	private Server server;
	
	@RequestMapping("/switch/save")
	public void  saveSwitch(HttpServletRequest request) throws Exception {
		//保存灯光状态
		String parameter = request.getParameter("name");
		System.out.println(parameter);
		
		Server server = new Server();
		server.message = new MqttMessage();
        server.message.setQos(2);
        server.message.setRetained(true);
        server.message.setPayload(parameter.getBytes());
        System.out.println(new String(server.message.getPayload()));
        server.publish(server.topic , server.message);
		
		Test test = switchService.findTest(1);
		test.setOnoff(parameter);
		switchService.saveSwitch(test);
	}
	
	@RequestMapping("/switch/query")
	@ResponseBody
	public Test querySwitch(Model model) {
		Test test = switchService.querySwitch(1);
//		System.out.println("======"+test.getOnoff());
		model.addAttribute("list", test);
		return test;
	}
}
