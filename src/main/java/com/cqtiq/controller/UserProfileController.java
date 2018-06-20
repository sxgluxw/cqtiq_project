package com.cqtiq.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cqtiq.pojo.User;
import com.cqtiq.pojo.Userprofile;
import com.cqtiq.redis.JedisClient;
import com.cqtiq.service.UserProfileService;
import com.cqtiq.utils.CookieUtils;

@Controller
public class UserProfileController {
	
	@Autowired
	private UserProfileService userProfileService;
	@Autowired
	private JedisClient jedisClient;
	
	@RequestMapping("/userprofile")
	public String queryUser(Model model,HttpServletRequest request,HttpServletResponse response) {
		String username = CookieUtils.getCookieValue(request, "user");
//		System.out.println("个人信息："+username);
		User user = userProfileService.selectUser(username);
//		System.out.println("个人信息数据库："+user);
		model.addAttribute("user",user);
		
		String value = CookieUtils.getCookieValue(request, "msg");
		System.out.println(value);
		if(value.equals("400")) {
			model.addAttribute("msg",value);
			CookieUtils.deleteCookie(request, response, "msg");
		}
		
		return "userprofile";
	}
	
	@RequestMapping("/userprofile/editUser")
	//@ResponseBody
	public String editUser(Userprofile userprofile,HttpServletRequest request,Model model,HttpServletResponse response) {
		System.out.println(userprofile);
		User user = userProfileService.selectUserById(userprofile.getUserid());
		if(!userprofile.getOld_password().isEmpty() && userprofile.getOld_password() != null) {
			if(user.getPassword().equals(userprofile.getOld_password())) {
				if(userprofile.getPassword().equals(userprofile.getRe_password()) && userprofile.getPassword()!= null && !userprofile.getPassword().equals("")) {
					user.setEmail(userprofile.getEmail());
					user.setPassword(userprofile.getPassword());
					user.setUsername(userprofile.getUsername());
					user.setRe_password(userprofile.getRe_password());
					userProfileService.updateUser(user);
				}
			}else {
				//request.setAttribute("msg", "400");
				CookieUtils.setCookie(request, response, "msg", "400");
//				model.addAttribute("msg", "400");
//				System.out.println("msgok");
				return "redirect:/userprofile";
			}
		}
		user.setEmail(userprofile.getEmail());
		user.setUsername(userprofile.getUsername());
		userProfileService.updateUser(user);
		return "redirect:/userprofile";
	}
}
