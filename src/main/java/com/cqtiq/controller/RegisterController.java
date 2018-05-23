package com.cqtiq.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cqtiq.pojo.User;
import com.cqtiq.service.RegisterService;

@Controller
public class RegisterController {
	
	@Autowired
	private RegisterService registerService;
	
	@RequestMapping("/register/userRegister")
	@ResponseBody
	public String registerUser( User user ) {
		System.out.println(user.getUsername());
		if(user.getPassword() != user.getRe_password()) {
			return "400";
		}
		boolean flag = registerService.getUserByName(user.getUsername());
		if(flag) {
			return "400";
		}
		registerService.registerSave(user);
		return "200";
	}
}
