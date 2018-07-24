package com.cqtiq.service;

import java.util.List;

import com.cqtiq.pojo.Ledlamp;

public interface LedLampService {

	void saveByData(Ledlamp l);

	List<Ledlamp> selecetStatus();

	List<Integer> selectTimeData();


}
