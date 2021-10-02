package com.mima.app.session.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BookingController {

	// 결제 예약 페이지로 이동 p.01
	@GetMapping("/reservationForm")
	public String reservationForm() {
		
		return "booking/reservationForm";
	}
}
