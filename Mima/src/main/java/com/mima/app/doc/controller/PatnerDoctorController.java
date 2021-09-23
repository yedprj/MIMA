package com.mima.app.doc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/docDash/*")
public class PatnerDoctorController {
	
	@GetMapping("docMain")
	public void docMain() {}
	
	@GetMapping("apptManage")
	public void apptManage() {}

	@GetMapping("apptManageCal")
	public void apptManageCal() {}

	
}
