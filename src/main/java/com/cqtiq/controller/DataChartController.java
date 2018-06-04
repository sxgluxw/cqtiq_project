package com.cqtiq.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONObject;
import com.cqtiq.pojo.Timeperature;
import com.cqtiq.service.DataChartService;

@Controller
public class DataChartController {
	private static final long serialVersionUID = 1L;

	@Autowired
	private DataChartService dataChartService;
	
	@RequestMapping("/datachart/data")
	private void getData(HttpServletResponse response) {
		Timeperature temperature = new Timeperature(); 
		
		//获取随机温度值
		Random random = new Random();
		float a = random.nextFloat() / 2 + 19;
		BigDecimal b = new BigDecimal(a).setScale(1, BigDecimal.ROUND_HALF_UP);
		temperature.setTimeperature(b+"℃");
		//获取当前时间值
		long curtime = System.currentTimeMillis();
		temperature.setTime(String.valueOf(curtime/1000));
		
		//存入数据库
		dataChartService.saveData(temperature);
		
		
		temperature = dataChartService.selectByAll();
		System.out.println(temperature);
		//存入数据库之后，删除一条记录
		dataChartService.deleteData();
		//转换时间格式  
        SimpleDateFormat myFmt=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
        String time = myFmt.format(new Date(Long.valueOf(temperature.getTime()+"000")));  
		//发送  
        response.setContentType("text/html;charset=utf-8");  
        try {
			response.getWriter().write(temperature.getTimeperature());
			response.getWriter().write(time);
		} catch (IOException e) {
			e.printStackTrace();
		} 
        
        /*Map<String,String> map = new HashMap<>(); 
        map.put("temperature", temperature.getTimeperature()); 
        map.put("time", time); 
        String result = JSONObject.toJSONString(map); 
        //发送到客户端 
        response.setContentType("text/html;charset=utf-8"); 
        try {
			response.getWriter().write(result);
		} catch (IOException e) {
			e.printStackTrace();
		}*/
        
        
       
	}
}
