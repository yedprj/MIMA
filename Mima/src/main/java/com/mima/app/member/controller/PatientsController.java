package com.mima.app.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mima.app.criteria.domain.Criteria;
import com.mima.app.criteria.domain.PageVO;
import com.mima.app.member.service.PatientsService;


@Controller
@RequestMapping("/patients/*")
public class PatientsController {
	
	@Autowired
	PatientsService patientsService;
	
	//e.29
	//관리자 회원정보조회
	@GetMapping("/list")
	public String list(Model model, @ModelAttribute("cri") Criteria cri) {
		int total = patientsService.getTotalPatientsCount(cri);
		
		model.addAttribute("list",patientsService.getList());
		model.addAttribute("list",patientsService.getPatientsList(cri));
		model.addAttribute("pageMaker", new PageVO(cri,total));
		return "admin/adlist";
	}
	
	//e.4
	//환자대쉬보드 Main 오늘의예약
	@GetMapping("/ptMain")
	public String list(Model model) {
		model.addAttribute("list",patientsService.ptgetList());
		return "patients/ptMain";
	}
	

}
