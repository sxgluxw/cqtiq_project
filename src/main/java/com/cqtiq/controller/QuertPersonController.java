package com.cqtiq.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cqtiq.pojo.Tbperson;
import com.cqtiq.pojo.User;
import com.cqtiq.service.QueryPersonService;
import com.cqtiq.utils.CookieUtils;

@Controller
public class QuertPersonController {
	
	@Autowired
	private QueryPersonService queryPersonService;
	
	//根据ID查询person数据，返回json数据
	@RequestMapping("/switch/queryPerson")
	@ResponseBody
	public Tbperson queryPerson(HttpServletRequest request,Model model) {
		Integer id = Integer.parseInt(request.getParameter("id"));
		Tbperson tbperson = queryPersonService.queryPerson(id);
		List<Tbperson>  list = queryPersonService.queryList();
		model.addAttribute("TbList", list);
		return tbperson;
	}
	
	//查询所有的person数据，然后在页面进行展示
	@RequestMapping("/switch")
	public String queryPerson1(Model model,HttpServletRequest request) {
		List<Tbperson>  list = queryPersonService.queryList();
		
		model.addAttribute("uList", list);
		String cookieValue = CookieUtils.getCookieValue(request, "token");
//		System.out.println("token的值"+cookieValue);
		return "switch";
	}
	
	//查询所有的person数据，然后在页面进行展示
	@RequestMapping("/switch/temp")
	public String queryPerson2(Model model) {
		List<Tbperson>  list = queryPersonService.queryList();
		
		model.addAttribute("uList", list);
		return "temp";
	}
	
	//person数据请求修改操作
	@RequestMapping("/switch/updateUser")
	@ResponseBody
	public String updatePerson(String name,Integer id,String sex,Integer age) {
		
		Tbperson person = queryPersonService.queryPerson(id);
		System.out.println(person);
		System.out.println(name);
		person.setAge(age);
		person.setName(name);
		person.setSex(sex);
		queryPersonService.updatePerson(person);
		return "true";
	}
/*	//person数据请求修改操作
	@RequestMapping("/switch/update")
	public String updatePerson(Tbperson tbperson) {
		System.out.println(tbperson);
		Integer id = tbperson.getId();
		Tbperson person = queryPersonService.queryPerson(id);
		person.setAge(tbperson.getAge());
		person.setName(tbperson.getName());
		person.setSex(tbperson.getSex());
		//queryPersonService.updatePerson(person);
		return "redirect:/switch";
	}
*/
	
	//保存功能实现
	@RequestMapping("/switch/saveUser")
	public String saveUser(String name,String sex,String age) {
		System.out.println(name);
		System.out.println(sex);
		if(StringUtils.isBlank(name)||StringUtils.isBlank(age)||StringUtils.isBlank(sex)) {
			return "redirect:/switch";
		}
		Tbperson person = new Tbperson();
		person.setAge(Integer.parseInt(age));
		person.setName(name);
		person.setSex(sex);
//		person.setId(10);
		System.out.println(person);
		queryPersonService.saveUser(person);
		return "redirect:/switch"; 
	}
	
	
	//删除功能实现
	@RequestMapping("/switch/deleteUser")
	@ResponseBody
	public String deleteUser(String id) {
		System.out.println(id);
		queryPersonService.deleteUser(Integer.parseInt(id));
		return "true";
	}
}
