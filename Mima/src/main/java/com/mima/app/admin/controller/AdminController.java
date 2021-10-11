package com.mima.app.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mima.app.criteria.domain.Criteria;
import com.mima.app.criteria.domain.PageVO;
import com.mima.app.member.domain.MemberVO;
import com.mima.app.member.service.MemberService;
import com.mima.app.member.service.PatientsService;


@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Autowired MemberService memberService;
	@Autowired PatientsService patientsService;
	
	//e.29
	//K 10/06 수정
	//관리자 회원정보조회(환자)
	@GetMapping("/adlist")
	public String list(Model model, @ModelAttribute("cri") Criteria cri) {
		int total = patientsService.getTotalPatientsCount(cri);
		int total1 = patientsService.getTotaldoctorCount(cri);
		int total2 = patientsService.getTotalpharCount(cri);
		
		model.addAttribute("getptList", patientsService.getptList());
		model.addAttribute("getdocList", patientsService.getdocList());
		model.addAttribute("getpmList", patientsService.getpmList());
		
		model.addAttribute("getPatientsList",patientsService.getPatientsList(cri));
		model.addAttribute("getdoctorList", patientsService.getdoctorList(cri));
		model.addAttribute("getpharList", patientsService.getpharList(cri));
		model.addAttribute("pageMaker", new PageVO(cri,total));
		return "admin/adlist";
	}
	
	//e.29
	//관리자 메인페이지
	@GetMapping("/adMain")
	public String adMain() { 
		return "admin/adMain";
	}
	
	//e.29
	// 파트너 의사 / 약국 승인 유무 검색
	@GetMapping("/patnerStatusSelect")
	public String patnerStatusSelect(Model model) {
		model.addAttribute("patnerStatusSelect",memberService.patnerStatusSelect());
		return "admin/patnerStatusSelect";
	}
		
	//e.29
	// 파트너 의사 / 약국 승인 등록
	@PostMapping("/patnerStatusUpdate")
	@ResponseBody
	public int patnerStatusUpdate(MemberVO vo) {
		System.out.println(vo.getLicense());
		int result = memberService.patnerStatusUpdate(vo);
		
		return result;	
	}
}

