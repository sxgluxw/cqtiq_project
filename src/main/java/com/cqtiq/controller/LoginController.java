package com.cqtiq.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cqtiq.pojo.User;
import com.cqtiq.service.LoginService;
import com.cqtiq.utils.CookieUtils;

@Controller
public class LoginController {
	@Autowired
	private LoginService loginService;

	@RequestMapping("/user/addUser")
	@ResponseBody
	public void query(String username, String password, User user) {
		System.out.println(username);
		System.out.println(password);
		System.out.println(user.getUsername());
	}

	//用户登录功能的实现
	private static final String TOKEN_KEY = "user";
	@RequestMapping("/login/login")
	@ResponseBody
	public String query1(@RequestParam String username, @RequestParam String password, Model model,HttpServletRequest request,HttpServletResponse response) {
		System.out.println(username+"====="+password);
		Subject subject = SecurityUtils.getSubject();
		// 用户名和密码信息
				AuthenticationToken authenticationToken = new UsernamePasswordToken(username, password);
		System.out.println("user接受到了");
		subject.login(authenticationToken);
		
		User user = loginService.queryUser(username, password);
		System.out.println(user);
		if (user == null) {
			model.addAttribute("msg", "错误");
			return "400";
		}
		String token = user.toString();
		if("".equals(CookieUtils.getCookieValue(request, token))&&StringUtils.isBlank(CookieUtils.getCookieValue(request, token)))
		{
			CookieUtils.setCookie(request, response, TOKEN_KEY, token);
		}else{
			CookieUtils.deleteCookie(request, response, TOKEN_KEY);
			CookieUtils.setCookie(request, response, TOKEN_KEY, token);
		}
		return "200";
	}
	
	//用户退出功能的实现
	@RequestMapping("/switch/exit")
	@ResponseBody
	public boolean exitUser(HttpServletRequest request,HttpServletResponse response) {
		String token = CookieUtils.getCookieValue(request, TOKEN_KEY);
		CookieUtils.deleteCookie(request, response, TOKEN_KEY);
		Subject subject = SecurityUtils.getSubject();
		subject.logout();
		boolean flag = true;
		return flag;
	}
}
