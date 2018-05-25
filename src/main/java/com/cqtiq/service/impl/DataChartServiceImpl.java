package com.cqtiq.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqtiq.mapper.TimeperatureMapper;
import com.cqtiq.pojo.Timeperature;
import com.cqtiq.pojo.TimeperatureExample;
import com.cqtiq.service.DataChartService;

@Service
public class DataChartServiceImpl implements DataChartService {

	@Autowired
	private TimeperatureMapper timeperatureMapper;
	
	@Override
	public void saveData(Timeperature temperature) {
		timeperatureMapper.insert(temperature);
	}

	@Override
	public Timeperature selectByAll() {
		TimeperatureExample example = new TimeperatureExample();
		List<Timeperature> list = timeperatureMapper.selectByExample(example);
		Timeperature timeperature = list.get(0);
		return timeperature;
	}

	@Override
	public void deleteData() {
		timeperatureMapper.deleteFristData();
	}

}
