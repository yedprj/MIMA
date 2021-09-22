package com.mima.app.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mima.app.member.domain.MemberVO;
import com.mima.app.member.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Autowired MemberService memberService;
	
	// 일반 회원가입 폼으로 이동
	@GetMapping("/signUpForm")
	public void signUpForm() { }
	
	// 아이디 중복 체크
	@PostMapping("/IdCheck")
	@ResponseBody
	public int idCheck(@RequestBody MemberVO vo) {
		int result = memberService.idCheck(vo);
		
		return result;
	}
	
	// 닉네임 중복 체크
	@PostMapping("/nickNameCheck")
	@ResponseBody
	public int nickNameCheck(@RequestBody MemberVO vo) {
		int result = memberService.nickNameCheck(vo);
		
		return result;
	}
}
