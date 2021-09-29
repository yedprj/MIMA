package com.mima.app.pharmacy.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mima.app.member.domain.MemberVO;
import com.mima.app.member.service.MemberService;
import com.mima.app.pharmacy.domain.PartnerPharmacyVO;
import com.mima.app.pharmacy.service.PatnerPharmacyService;

@Controller
@RequestMapping("/pharmacy/*")
public class PartnerPharmacyController {
	
	@Autowired PatnerPharmacyService partPhaService;
	@Autowired MemberService memberSerivce;
	
	// 약국 대쉬보드 [K]210929 
	@GetMapping("/pharmacyDash")
	public void pharmacyDash(PartnerPharmacyVO vo, Model model) {
		model.addAttribute("profile", partPhaService.selectOne(vo));
	}
	
	// 약배달 관리페이지 [K]210929
	@GetMapping("/medDelivery")
	public void medDelivery() {}
	
	// 복약지도 관리페이지 [K]210929
	@GetMapping("/medGuid")
	public void medGuid() {}
	
	// 프로필 페이지 [K]210929
	@GetMapping("/myProfile")
	public void myProfile(PartnerPharmacyVO vo, Model model) {
		model.addAttribute("profile", partPhaService.selectOne(vo));
	}
	
	// 프로필 수정 - ajax [K]210929
	@PutMapping("/profileUpdate")
	@ResponseBody
	public int profileUpdate(@RequestBody PartnerPharmacyVO vo, Model model) {
		return partPhaService.profileUpdate(vo);
	}
	
	// 리뷰페이지 [K]210929
	@GetMapping("/review")
	public void review() {}

	// 비밀번호 변경페이지 [K]210929
	@GetMapping("/pwUpdate")
	public void pwConfirmPage(PartnerPharmacyVO vo, Model model) {
		model.addAttribute("memberNo", vo.getMemberNo());
	}
	
	// 현재 비밀번호 확인페이지 [K]210929
	@PostMapping("/pwConfirm")
	@ResponseBody
	public MemberVO pwConfirm(@RequestBody MemberVO vo, Model model) {
		return  memberSerivce.memberLogin(vo);
	}
	

}
