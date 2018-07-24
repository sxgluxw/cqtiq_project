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

	// 用户信息异步展示功能
	@RequestMapping("/userprofile")
	public String queryUser(Model model, HttpServletRequest request, HttpServletResponse response) {
		String username = CookieUtils.getCookieValue(request, "user");
		// System.out.println("个人信息："+username);
		User user = userProfileService.selectUser(username);
		// System.out.println("个人信息数据库："+user);
		model.addAttribute("user", user);

		String value = CookieUtils.getCookieValue(request, "msg");
		// System.out.println(value);
		if ("400".equals(value) && !value.isEmpty()) {
			model.addAttribute("msg", value);
			CookieUtils.deleteCookie(request, response, "msg");
			return "userprofile";
		} else

			return "userprofile";
	}

	// 根据用户修改后的信息进行操作
	@RequestMapping("/userprofile/editUser")
	// @ResponseBody
	public String editUser(Userprofile userprofile, HttpServletRequest request, Model model,
			HttpServletResponse response) {
		// System.out.println(userprofile);
		// 判断用户名是否被占用，如果是，阻止强制修改
		boolean falg = userProfileService.getFalgUser(userprofile.getUsername(), userprofile.getUserid());
		System.out.println(falg);
		if (!falg) {
			CookieUtils.deleteCookie(request, response, "loginMsg");
			CookieUtils.setCookie(request, response, "loginMsg", "400");
			return "redirect:/userprofile";
		}

		// 根据隐藏域ID查询user
		User user = userProfileService.selectUserById(userprofile.getUserid());

		// 判断用户是否修改密码，以及原始密码是否正确
		if (!userprofile.getOld_password().isEmpty() && userprofile.getOld_password() != null) {
			if (user.getPassword().equals(userprofile.getOld_password())) {
				if (userprofile.getPassword().equals(userprofile.getRe_password()) && userprofile.getPassword() != null
						&& !userprofile.getPassword().equals("")) {
					user.setEmail(userprofile.getEmail());
					user.setPassword(userprofile.getPassword());
					user.setUsername(userprofile.getUsername());
					user.setRe_password(userprofile.getRe_password());
					userProfileService.updateUser(user);
					// 如果修改后，跳转登录页面，重新登录
					CookieUtils.deleteCookie(request, response, "loginMsg");
					CookieUtils.setCookie(request, response, "loginMsg", "200");
					// 删除原来cookie值，将修改后的username存入cookie中
					User user1 = userProfileService.selectUserById(userprofile.getUserid());
					CookieUtils.deleteCookie(request, response, "user");
					CookieUtils.setCookie(request, response, "user", user1.getUsername());
					return "redirect:/userprofile";
				}
			} else {
				// 原始密码不正确
				// request.setAttribute("msg", "400");
				CookieUtils.deleteCookie(request, response, "msg");
				CookieUtils.setCookie(request, response, "msg", "400");
				// model.addAttribute("msg", "400");
				// System.out.println("msgok");
				return "redirect:/userprofile";
			}
		}else {
			// 原始密码不正确
			// request.setAttribute("msg", "400");
			CookieUtils.deleteCookie(request, response, "msg");
			CookieUtils.setCookie(request, response, "msg", "400");
			// model.addAttribute("msg", "400");
			// System.out.println("msgok");
			return "redirect:/userprofile";
		}

		// 用户不修改密码的功能
		user.setEmail(userprofile.getEmail());
		user.setUsername(userprofile.getUsername());
		userProfileService.updateUser(user);
		// 修改后重置username中的cookie值，并跳转到登录页面
		User user1 = userProfileService.selectUserById(userprofile.getUserid());
		String value = CookieUtils.getCookieValue(request, "user");
		CookieUtils.deleteCookie(request, response, "user");
		CookieUtils.setCookie(request, response, "user", user1.getUsername());
		if (!user1.getUsername().equals(value)) {
			CookieUtils.deleteCookie(request, response, "loginMsg");
			CookieUtils.setCookie(request, response, "loginMsg", "200");
		}
		return "redirect:/userprofile";
	}

	// 判断用户是否被占用，如果是，进行提醒。
	@RequestMapping("/userprofile/getFlag")
	@ResponseBody
	public String getFlag(String username, int userid, HttpServletRequest request, Model model,
			HttpServletResponse response) {
		// System.out.println(userprofile);
		boolean falg = userProfileService.getFalgUser(username, userid);
//		System.out.println(falg);
//		System.out.println(username + "" + userid);
		if (!falg) {
			CookieUtils.deleteCookie(request, response, "flagMsg");
			CookieUtils.setCookie(request, response, "flagMsg", "400");
			return "400";
		}

		return "200";
	}
}
