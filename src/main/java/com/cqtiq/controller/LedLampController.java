package com.cqtiq.controller;

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

import com.cqtiq.pojo.Ledlamp;
import com.cqtiq.service.LedLampService;
import com.google.gson.Gson;
@Controller
public class LedLampController {

	@Autowired
	private LedLampService ledLampService;
	
	private Gson g = new Gson();
	
	@RequestMapping(value = "/ledlamp/{divnum}/{data}/{time}",method= RequestMethod.GET)
	public void getLedData(@PathVariable(value= "divnum") String divnum , @PathVariable(value= "data") String data , @PathVariable(value="time") String time) {
		Ledlamp l = new Ledlamp();
		l.setData(data);
		l.setDevnum(divnum);
		l.setTime(new Timestamp(new Date().getTime()));
		ledLampService.saveByData(l);
		
	
	}
	
	
	@RequestMapping("/industry/query")
	@ResponseBody
	public String  queryData(@RequestParam(value = "callback",required = false) String callback) {
		List<Ledlamp> list = ledLampService.selecetStatus();
		
//		System.out.println("callback:"+callback);

		if(StringUtils.isNotBlank(callback)) {
			return callback + "(" + g.toJson(list) + ");";
			}
		
		return g.toJson(list);
		
	}
	
	
	@RequestMapping("/industry/queryTimeData")
	@ResponseBody
	public String queryTimeData(@RequestParam(value = "callback",required = false) String callback) {
		List<Integer> list = ledLampService.selectTimeData();
		
//		System.out.println("callback:"+callback);
		if(StringUtils.isNotBlank(callback)) {
			return callback + "(" + g.toJson(list) + ");";
			}
		return g.toJson(list);
	}
}
