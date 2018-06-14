package com.cqtiq.service;

import java.util.List;

import com.cqtiq.pojo.Echartdata;
import com.cqtiq.pojo.Gas;
import com.cqtiq.pojo.LineSections;
import com.cqtiq.pojo.Rainfall;
import com.cqtiq.pojo.Timeperature;

public interface EchartService {
	Echartdata getEcharData();

	void saveEchartData(Echartdata saveData);

	List<LineSections> queryLine();

	void saveLineData(LineSections saveLine);
	
	Gas getLastGas();
	
	void saveGasData(Gas gasData);

	List<Gas> selectTwoHundred();

	Rainfall selectFirstRain();

	void delectFirstRain(Rainfall firstRain);

	List<Rainfall> getRainData();
}
