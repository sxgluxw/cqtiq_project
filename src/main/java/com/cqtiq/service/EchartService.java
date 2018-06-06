package com.cqtiq.service;

import com.cqtiq.pojo.Echartdata;

public interface EchartService {
	Echartdata getEcharData();

	void saveEchartData(Echartdata saveData);

	void deleteFristData();
}
