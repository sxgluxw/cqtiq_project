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
import com.cqtiq.pojo.Gas;
import com.cqtiq.pojo.LineSections;
import com.cqtiq.pojo.Rainfall;
import com.cqtiq.pojo.Timeperature;
import com.cqtiq.service.EchartService;

@Controller
public class TotalPageController {
	
	@Autowired
	private EchartService echartService;
	
	@RequestMapping("/echart/queryData1")
	@ResponseBody
	public Echartdata queryData() {
		
		
		
		System.out.println("执行了");
		
		Echartdata saveData = new Echartdata();
		saveData.setH(getData(100, 2));
		saveData.setTach(getData(7, 2));
		saveData.setGas(getData(2, 2));
		saveData.setWater(getData(2, 2));
		
		//echartService.saveEchartData(saveData);
		
		Echartdata echarData = echartService.getEcharData();
		//System.out.println("guages:"+echarData);
		Echartdata backEcharData = echartService.getBackEchartData(echarData.getId()-1);
		return backEcharData;
	}
	
	
	public double getData(int r,int move) {
		int ran = (int) ((Math.random()*r)*100);
		BigDecimal bigDecimal = new BigDecimal(ran);
		System.out.println(bigDecimal.movePointLeft(move).doubleValue());
		return (bigDecimal.movePointLeft(move).doubleValue());
	}
	
	@RequestMapping("/line/listData1")
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
	
	

	@RequestMapping("/echart/piezometerData1")
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
		//System.out.println("压力"+echarData);
		return echarData;
	}
	
	@RequestMapping("/gas/listData1")
	@ResponseBody
	public List<Gas> getGasData() {
		Gas gasData = new Gas();
		Gas lastGas = echartService.getLastGas();
		for (int i = 0; i < 20; i++) {
			gasData.setGasdata((int)Math.round((Math.random() - 0.5) * 20 + lastGas.getGasdata()));
			SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
			gasData.setTime(sdf.format(System.currentTimeMillis()));
			
			echartService.saveGasData(gasData);
			
		}
		
		List<Gas> list = echartService.selectTwoHundred();
//		Collections.reverse(list);
		return list ;
	}
	@RequestMapping("/rainfall/rainData1")
	@ResponseBody
	public List<Rainfall> getRainData() {
		Rainfall firstRain = echartService.selectFirstRain();
		SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd HH:mm:ss");
		firstRain.setId(null);
		firstRain.setTime(sdf.format(System.currentTimeMillis()));
		echartService.delectFirstRain(firstRain);
		
		List<Rainfall> list = echartService.getRainData();
		Collections.reverse(list);
		return list ;
	}
}
