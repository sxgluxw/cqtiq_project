package com.cqtiq.controller;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cqtiq.pojo.Echartdata;
import com.cqtiq.pojo.LineSections;
import com.cqtiq.pojo.Timeperature;
import com.cqtiq.service.EchartService;

@Controller
public class EchartController {
	
	@Autowired
	private EchartService echartService;
	
	@RequestMapping("/echart/queryData")
	@ResponseBody
	public Echartdata queryData() {
		
		
		
		System.out.println("执行了");
		
		Echartdata saveData = new Echartdata();
		saveData.setH(getData(100, 2));
		saveData.setTach(getData(7, 2));
		saveData.setGas(getData(2, 2));
		saveData.setWater(getData(2, 2));
		
		echartService.saveEchartData(saveData);
		
		Echartdata echarData = echartService.getEcharData();
		return echarData;
	}
	
	
	public double getData(int r,int move) {
		int ran = (int) ((Math.random()*r)*100);
		BigDecimal bigDecimal = new BigDecimal(ran);
		System.out.println(bigDecimal.movePointLeft(move).doubleValue());
		return (bigDecimal.movePointLeft(move).doubleValue());
	}
	
	@RequestMapping("/line/listData")
	@ResponseBody
	public List<LineSections> queryLine(){
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
		LineSections saveLine = new LineSections();
		saveLine.setTime(sdf.format(System.currentTimeMillis()));
		saveLine.setNumdata((int)(Math.random()*800));
		echartService.saveLineData(saveLine);
		
		
		
		List<LineSections> list = echartService.queryLine();
		Collections.reverse(list);
		
		return list;
	}
	
	

	@RequestMapping("/echart/piezometerData")
	@ResponseBody
	public Echartdata getPiezometer() {
		System.out.println("执行了");
		
		Echartdata saveData = new Echartdata();
		saveData.setH(getData(100, 2));
		saveData.setTach(getData(7, 2));
		saveData.setGas(getData(2, 2));
		saveData.setWater(getData(2, 2));
		
		echartService.saveEchartData(saveData);
		
		Echartdata echarData = echartService.getEcharData();
		return echarData;
	}
}
