package com.cqtiq.service;

import com.cqtiq.pojo.Test;

public interface SwitchService {
	Test findTest(Integer id);
	
	void saveSwitch(Test test);

	Test querySwitch(int i);

}
