package com.cqtiq.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqtiq.mapper.TestMapper;
import com.cqtiq.pojo.Test;
import com.cqtiq.service.SwitchService;

@Service
public class SwitchServiceImpl implements SwitchService {

	@Autowired
	private TestMapper testMapper;
	

	@Override
	public Test findTest(Integer id) {
		Test test = testMapper.selectByPrimaryKey(id);
		return test;
	}

	@Override
	public void saveSwitch(Test test) {
		testMapper.updateByPrimaryKey(test);
	}

	@Override
	public Test querySwitch(int i) {
		Test test = testMapper.selectByPrimaryKey(i);
		return test;
	}

}
