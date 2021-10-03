package com.mima.app.session.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.mima.app.member.domain.MemberVO;
import lombok.extern.java.Log;

@Log
@Controller
public class BookingController {

	// 결제 예약 페이지로 이동 p.01
	@GetMapping("/reservationForm")
	public String reservationForm(HttpServletRequest request) {
		
		/*
		 * HttpSession session = request.getSession();
		 * log.info(session.getAttribute("session").toString()); 
		 * MemberVO mvo = (MemberVO) session.getAttribute("session"); 
		 * log.info(mvo.getName());
		 */
		return "booking/reservationForm";
	}
}
