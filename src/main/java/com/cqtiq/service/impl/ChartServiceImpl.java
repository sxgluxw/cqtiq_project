package com.cqtiq.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqtiq.mapper.BardataMapper;
import com.cqtiq.pojo.Bardata;
import com.cqtiq.pojo.BardataExample;
import com.cqtiq.service.ChartService;

@Service
public class ChartServiceImpl implements ChartService {
	
	@Autowired
	private BardataMapper bardataMapper;

	@Override
	public List<Bardata> showChart() {
		
		BardataExample example = new BardataExample();
		List<Bardata> list = bardataMapper.selectByExample(example );
		return list;
	}

	@Override
	public void deleteFristData() {
		bardataMapper.deleteFristData();
	}

	@Override
	public List<Bardata> selectLastData() {
		List<Bardata> barData = bardataMapper.selectLastBarData();
		return barData;
	}

	@Override
	public void saveChart(Bardata bardata) {
		bardataMapper.insert(bardata);
	}

}
