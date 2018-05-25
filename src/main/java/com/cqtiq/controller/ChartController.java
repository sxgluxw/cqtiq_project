package com.cqtiq.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cqtiq.pojo.Bardata;
import com.cqtiq.service.ChartService;

@Controller
public class ChartController {
	
	@Autowired
	private ChartService chartService;
	
	@RequestMapping("/chart/showChart")
	@ResponseBody
	public List<Bardata> barShow() {
		System.out.println("图表查询了");
		List<Bardata> list = chartService.showChart();
		System.out.println(list);
		
		//删除最后一条数据
		chartService.deleteFristData();
		
		Bardata bardata = new Bardata();
		bardata.setA(1+(int)(Math.random()*100));
		bardata.setB(1+(int)(Math.random()*100));
		
		List<Bardata> lastData = chartService.selectLastData();
		
//		int y = (Integer.parseInt(lastData.get(0).getY()))+1;
		long time = System.currentTimeMillis();
//		System.out.println("时间戳"+time);
		String t = String.valueOf(time/1000);
//		System.out.println("时间字符串"+t);
		
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
		String y = sdf.format(new Date(time));;
		bardata.setY(y);
		
		chartService.saveChart(bardata);
		System.out.println("成功"+bardata);
		
		return list ;
	}
}
