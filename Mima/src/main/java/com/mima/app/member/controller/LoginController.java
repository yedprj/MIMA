package com.mima.app.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller	
public class LoginController {
	
	// 로그인 폼으로 이동
	@GetMapping("/login")
	public String loginForm(String error, String logout, Model model, HttpServletResponse response) {
		
		if (error != null) {
			model.addAttribute("error", "아이디 또는 비밀번호가 틀렸거나 아직 승인되지 않았습니다.");
		}
		
		if (logout != null) {
			model.addAttribute("logout", "로그아웃 하셨습니다.");
		}
		
		/*
		 * Cookie cookie = new Cookie("role", null); cookie.setComment("Role을 가지는 쿠키");
		 * cookie.setMaxAge(60*60*24*365); response.addCookie(cookie);
		 */
  
		return "member/loginForm";
	}
}
