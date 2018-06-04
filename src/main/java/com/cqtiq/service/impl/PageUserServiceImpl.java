package com.cqtiq.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqtiq.mapper.PageuserMapper;
import com.cqtiq.pojo.Pageuser;
import com.cqtiq.pojo.PageuserExample;
import com.cqtiq.service.PageUserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class PageUserServiceImpl implements PageUserService {

	@Autowired
	private PageuserMapper pageuserMapper;
	
	@Override
	public PageInfo<Pageuser> findAll(int page, int pageSize) {
		PageHelper.startPage(page, pageSize);
//		PageuserExample example = new PageuserExample();
		
//		List<Pageuser> list = pageuserMapper.selectByExample(example );
		
		List<Pageuser> list = pageuserMapper.selectAll();
//		System.out.println(list);
		return new PageInfo<>(list);
	}

}
