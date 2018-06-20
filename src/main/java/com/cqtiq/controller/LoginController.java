package com.cqtiq.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

import com.cqtiq.pojo.User;
import com.cqtiq.redis.JedisClient;
import com.cqtiq.service.LoginService;
import com.cqtiq.utils.CookieUtils;
import com.cqtiq.utils.ImageUtil;

@Controller
public class LoginController {
	@Autowired
	private LoginService loginService;
	
	@Resource
//	@Qualifier("jedisClient")
	private JedisClient jedisClient;

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
		
		System.out.println("User输出："+user);
		if (user == null) {
			model.addAttribute("msg", "错误");
			return "400";
		}
		
		jedisClient.set("redisToken"+user.getId(), user.getUsername());
		System.out.println("内存缓存数据库"+jedisClient.get("redisToken"+user.getId()));
		String token = user.getUsername().toString();
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
		Subject subject = SecurityUtils.getSubject();
		subject.logout();
		String token = CookieUtils.getCookieValue(request, TOKEN_KEY);
		CookieUtils.deleteCookie(request, response, TOKEN_KEY);
		boolean flag = true;
		return flag;
	}
	
	
	
}
