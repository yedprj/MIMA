package com.mima.app.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mima.app.member.domain.MemberVO;
import com.mima.app.member.service.MemberService;


@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Autowired MemberService memberService;
	
	//페이지
	@GetMapping("/adMain")
	public void adMain() { }
	
	// 파트너 의사 / 약국 승인 유무 검색
	@GetMapping("/patnerStatusSelect")
	public void patnerStatusSelect(Model model) {
		model.addAttribute("patnerStatusSelect",memberService.patnerStatusSelect());
	}
		
	// 파트너 의사 / 약국 승인 등록
	@PutMapping("patnerStatusUpdate")
	@ResponseBody
	public int patnerStatusUpdate(@RequestBody MemberVO vo) {
		int result = memberService.patnerStatusUpdate(vo);
		return result;
	}
	
	 
}

