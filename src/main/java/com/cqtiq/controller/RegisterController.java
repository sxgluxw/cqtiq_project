package com.cqtiq.controller;

import java.awt.image.BufferedImage;
import java.io.OutputStream;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cqtiq.pojo.User;
import com.cqtiq.service.RegisterService;
import com.cqtiq.utils.ImageUtil;

@Controller
public class RegisterController {
	@Autowired
	private RegisterService registerService;
	
	private  Object[] objs = ImageUtil.createImage();
	
	@RequestMapping("/register/userRegister")
	@ResponseBody
	public String registerUser( User user ) {
//		System.out.println(user.getUsername());
//		System.out.println(objs[0]);
//		System.out.println(user.getVcode());
		if(!user.getVcode().equalsIgnoreCase((String) objs[0])) {
			return "500";
		}
		if(!user.getPassword().equals(user.getRe_password())) {
			return "300";
		}
		boolean flag = registerService.getUserByName(user.getUsername());
		if(flag) {
			return "400";
		}
		registerService.registerSave(user);
		return "200";
	}
	
	//测试验证码
		//生成验证码图片  
		@RequestMapping("/open/valicode.do") 
		public void valicode(HttpServletResponse response,HttpSession session) throws Exception{  
		    //利用图片工具生成图片  
		    //第一个参数是生成的验证码，第二个参数是生成的图片  
		    //Object[] objs = ImageUtil.createImage(); 
		    //将验证码存入Session  
		    session.setAttribute("imageCode",objs[0]);  
		    //将图片输出给浏览器  
		    BufferedImage image = (BufferedImage) objs[1];  
		    response.setContentType("image/png");  
		    OutputStream os = response.getOutputStream();  
		    ImageIO.write(image, "png", os);  
		      
		}  
}
