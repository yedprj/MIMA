package com.mima.app.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	//페이지
	@GetMapping("/adMain")
	public void adMain() { }
	
	

}
