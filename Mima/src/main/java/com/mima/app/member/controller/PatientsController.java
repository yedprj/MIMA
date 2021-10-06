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
	//환자대쉬보드 메인 페이지
	@GetMapping("/ptMain")
	public String ptMain(Model model) {
		model.addAttribute("list", patientsService.ptgetList());
		model.addAttribute("ptMainhisList", patientsService.ptMainhisList());
		model.addAttribute("ptMainreList", patientsService.ptMainreList());
		return "patients/ptMain";
	}
	
	//환자대쉬보드 예약관리 페이지 e.5
	@GetMapping("/ptBookManage")
	public String ptBookManage(Model model, @ModelAttribute("cri")Criteria cri) {
		int total = patientsService.getTotalPtbmCount(cri);
		
		model.addAttribute("ptbmList", patientsService.ptbmList());
		model.addAttribute("getPtbmList", patientsService.getPtbmList(cri));
		model.addAttribute("pageMaker", new PageVO(cri,total));
		return "patients/ptBookManage";
	}
	
	//환자대쉬보드 진료내역 페이지 e.5
	@GetMapping("/ptHistory")
	public String ptHistory(Model model) {
		model.addAttribute("ptHistoryList", patientsService.ptHistoryList());
		return "patients/ptHistory";
	}
	
	//환자대쉬보드 나의후기 페이지 e.5
	@GetMapping("/ptReview")
	public String ptReview(Model model) {
		model.addAttribute("ptReviewList", patientsService.ptReviewList());
		return "patients/ptReview";
	}
	
	//환자대쉬보드 약배달 페이지 K.10/06
	@GetMapping("/ptMedelivery")
	public String ptMedelivery(Model model) {
	
		return "patients/ptMedelivery";
	}
	

	
}
