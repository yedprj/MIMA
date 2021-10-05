package com.mima.app.session.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mima.app.doc.domain.DocAvailabilityVO;
import com.mima.app.doc.service.DocAvailabilityService;
import com.mima.app.member.service.MemberService;

import lombok.extern.java.Log;

@Log
@Controller
public class BookingController {

	@Autowired MemberService memberService;
	@Autowired DocAvailabilityService docAvailabilityService;
	
	// 결제 예약 페이지로 이동 p.01
	@GetMapping("/reservationForm")
	public String reservationForm(Model model) {
		
		model.addAttribute("doctors", memberService.selectDoctorY());
		
		return "booking/reservationForm";
	}
	
	// 결제 페이지 의사 검사 가능 시간 조회
	@PostMapping("/selectDocTime")
	@ResponseBody
	public List<String> selectDocTime(@RequestBody DocAvailabilityVO docVO) {
		System.out.println("============"+docVO.getDay());
		System.out.println("============"+docVO.getDocNo());
		String time = docAvailabilityService.selectDocTime(docVO.getDay(), docVO.getDocNo());
		
		List<String> list = Arrays.asList(time.split(" "));
		log.info(list.toString());
		
		return list;
	}
}
