package com.cqtiq.service;

import com.cqtiq.pojo.Timeperature;

public interface DataChartService {

	void saveData(Timeperature temperature);

	Timeperature selectByAll();

	void deleteData();

}
