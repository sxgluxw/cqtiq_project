package com.cqtiq.service;

import java.util.List;

import com.cqtiq.pojo.Bardata;

public interface ChartService {
	List<Bardata> showChart();

	void deleteFristData();
	
	List<Bardata> selectLastData();

	void saveChart(Bardata bardata);
}
