package com.cqtiq.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cqtiq.config.WebSocketData;
import com.cqtiq.pojo.Ledlamp;
import com.cqtiq.service.LedLampService;
import com.cqtiq.utils.CQWebSocket;
import com.google.gson.Gson;

@Controller
public class LedLampController {

	@Autowired
	private LedLampService ledLampService;

	private Gson g = new Gson();
	
	
	@RequestMapping(value="/websocket")
	public String dodo(){
		return "websocket/websocket";
	}

	/**
	 * 处理上报数据
	 * 
	 * @param divnum
	 * @param data
	 * @param time
	 * @throws Exception
	 */
	@RequestMapping(value = "/ledlamp/{divnum}/{data}/{time}", method = RequestMethod.GET)
	public void getLedData(@PathVariable(value = "divnum") String divnum, @PathVariable(value = "data") String data,
			@PathVariable(value = "time") String time) throws Exception {
		Ledlamp l = new Ledlamp();
		l.setData(data);
		l.setDevnum(divnum);
		l.setTime(new Timestamp(new Date().getTime()));
		ledLampService.saveByData(l);

		// 查询七日内操作次数
		List<Integer> list = ledLampService.selectTimeData();

		CQWebSocket.sendInfo(WebSocketData.LED_LAMP_CONFIG + "," + l.getData() + "," + list.get(0) + "," + list.get(1)
				+ "," + list.get(2) + "," + list.get(3) + "," + list.get(4) + "," + list.get(5) + "," + list.get(6)
				+ "," + list.get(7)+","+g.toJson(ledLampService.selecetStatus()));
		System.out.println("websocket发送成功");
	}

	/**
	 * 查询十条数据
	 * 
	 * @param callback
	 * @return
	 */
	@RequestMapping("/industry/query")
	@ResponseBody
	public String queryData(@RequestParam(value = "callback", required = false) String callback) {
		// 查询十条数据
		List<Ledlamp> list = ledLampService.selecetStatus();

		// System.out.println("callback:"+callback);

		if (StringUtils.isNotBlank(callback)) {
			return callback + "(" + g.toJson(list) + ");";
		}

		return g.toJson(list);

	}

	/**
	 * 查询七日内操作次数
	 * 
	 * @param callback
	 * @return
	 */
	@RequestMapping("/industry/queryTimeData")
	@ResponseBody
	public String queryTimeData(@RequestParam(value = "callback", required = false) String callback) {
		List<Integer> list = ledLampService.selectTimeData();

		// System.out.println("callback:"+callback);
		if (StringUtils.isNotBlank(callback)) {
			return callback + "(" + g.toJson(list) + ");";
		}
		return g.toJson(list);
	}
}
