package com.cqtiq.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqtiq.mapper.EchartdataMapper;
import com.cqtiq.mapper.LineSectionsMapper;
import com.cqtiq.mapper.TimeperatureMapper;
import com.cqtiq.pojo.Echartdata;
import com.cqtiq.pojo.LineSections;
import com.cqtiq.pojo.Timeperature;
import com.cqtiq.service.EchartService;

@Service
public class EchartServiceImpl implements EchartService {
	@Autowired
	private EchartdataMapper echartdataMapper;
	@Autowired
	private TimeperatureMapper timeperatureMapper;
	@Autowired
	private LineSectionsMapper  lineSectionsMapper;
	

	@Override
	public Echartdata getEcharData() {
		Echartdata echartdata = echartdataMapper.selectLastEchartData();
		return echartdata;
	}



	@Override
	public void saveEchartData(Echartdata saveData) {
		echartdataMapper.deleteFristData();
		echartdataMapper.insert(saveData);
	}



	@Override
	public List<LineSections> queryLine() {
		List<LineSections> list = lineSectionsMapper.selectDescLineData();
		return list;
	}



	@Override
	public void saveLineData(LineSections saveLine) {
		lineSectionsMapper.deleteFristData();
		lineSectionsMapper.insert(saveLine);
	}
}
