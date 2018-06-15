package com.cqtiq.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqtiq.mapper.EchartdataMapper;
import com.cqtiq.mapper.GasMapper;
import com.cqtiq.mapper.LineSectionsMapper;
import com.cqtiq.mapper.RainfallMapper;
import com.cqtiq.mapper.TimeperatureMapper;
import com.cqtiq.pojo.Echartdata;
import com.cqtiq.pojo.Gas;
import com.cqtiq.pojo.LineSections;
import com.cqtiq.pojo.Rainfall;
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
	@Autowired
	private GasMapper gasMapper;
	@Autowired
	private RainfallMapper rainfallMapper;
	

	@Override
	public Echartdata getEcharData() {
		Echartdata echartdata = echartdataMapper.selectLastEchartData();
		return echartdata;
	}


	@Override
	public Echartdata getBackEchartData(int i) {
		Echartdata echartdata = echartdataMapper.selectByPrimaryKey(i);
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



	@Override
	public Gas getLastGas() {
		Gas gasData = gasMapper.selectLastGasData();
		return gasData;
	}



	@Override
	public void saveGasData(Gas gasData) {
		gasMapper.insert(gasData);
	}



	@Override
	public List<Gas> selectTwoHundred() {
		gasMapper.deleteFristData();
		return gasMapper.selectDescGasData();
	}



	@Override
	public Rainfall selectFirstRain() {
		Rainfall firstRainData = rainfallMapper.selectFirstRainData();
		return firstRainData;
	}



	@Override
	public void delectFirstRain(Rainfall firstRain) {
		rainfallMapper.insert(firstRain);
		rainfallMapper.deleteFristData();
	}



	@Override
	public List<Rainfall> getRainData() {
		List<Rainfall> list = rainfallMapper.selectDescRainData();
		return list;
	}



}
