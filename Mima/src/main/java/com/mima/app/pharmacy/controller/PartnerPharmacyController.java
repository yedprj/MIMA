package com.mima.app.pharmacy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/pharmacy/*")
public class PartnerPharmacyController {
	
	// 약국 대쉬보드 [K]210929 
	@GetMapping("pharmacyDash")
	public void pharmacyDash() {}
	
	// 약배달 관리페이지 [K]210929
	@GetMapping("medDelivery")
	public void medDelivery() {}
	
	// 복약지도 관리페이지 [K]210929
	@GetMapping("medGuid")
	public void medGuid() {}
	
	// 프로필 페이지 [K]210929
	@GetMapping("myProfile")
	public void myProfile() {}
	
	// 리뷰페이지 [K]210929
	@GetMapping("review")
	public void review() {}

	// 비밀번호 변경페이지 [K]210929
	@GetMapping("pwUpdate")
	public void pwUpdate() {}
	

}
