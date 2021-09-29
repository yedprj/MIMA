package com.mima.app.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mima.app.member.service.PatientsService;


@Controller
@RequestMapping("/patients/*")
public class PatientsController {
	
	@Autowired
	PatientsService patientsService;
	
	//e.29
	//관리자 회원정보조회
	@GetMapping("/list")
	public String list(Model model) {
		model.addAttribute("list",patientsService.getList());
		return "admin/adlist";
	}
	
	
	

}
