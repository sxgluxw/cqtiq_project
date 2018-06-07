package com.cqtiq.service;

import java.util.List;

import com.cqtiq.pojo.Echartdata;
import com.cqtiq.pojo.LineSections;
import com.cqtiq.pojo.Timeperature;

public interface EchartService {
	Echartdata getEcharData();

	void saveEchartData(Echartdata saveData);

	List<LineSections> queryLine();

	void saveLineData(LineSections saveLine);
}
