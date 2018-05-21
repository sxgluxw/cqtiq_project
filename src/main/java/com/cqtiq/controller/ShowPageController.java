package com.cqtiq.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ShowPageController {
	@RequestMapping("/")
	public String showIndexPage() {
		return "index";
	}
	/*@RequestMapping("/empty")
	public String showIndexPage2() {
		return "empty";
	}*/
	
	@RequestMapping("/{page}")
	public String showIndexPage1(@PathVariable String page) {
		return page;
	}
	
	
}
