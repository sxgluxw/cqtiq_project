package com.cqtiq.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cqtiq.pojo.Pageuser;
import com.cqtiq.service.PageUserService;
import com.github.pagehelper.PageInfo;

@Controller
public class PageUserController {
	@Autowired
	private PageUserService pageUserService;
	
	@RequestMapping(value= "/pageuser/list",method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> findAllPageUser(int page , int pageSize){
		Map<String , Object> map = new HashMap<>();
		
		PageInfo<Pageuser> pager = pageUserService.findAll(page,pageSize);
		
		//总条数
		map.put("total", pager.getTotal());
		//获取每页数据
		map.put("rows", pager.getList());
//		System.out.println(pager.getList());
		return map;
	}
}
