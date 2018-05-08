package com.cqtiq.controller;

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
		return list ;
	}
}
