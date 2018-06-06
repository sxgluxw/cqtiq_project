package com.cqtiq.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqtiq.mapper.EchartdataMapper;
import com.cqtiq.pojo.Echartdata;
import com.cqtiq.service.EchartService;

@Service
public class EchartServiceImpl implements EchartService {
	@Autowired
	private EchartdataMapper echartdataMapper;
	
	

	@Override
	public Echartdata getEcharData() {
		Echartdata echartdata = echartdataMapper.selectLastEchartData();
		return echartdata;
	}



	@Override
	public void saveEchartData(Echartdata saveData) {
		echartdataMapper.insert(saveData);
	}



	@Override
	public void deleteFristData() {
		echartdataMapper.deleteFristData();
	}
}
