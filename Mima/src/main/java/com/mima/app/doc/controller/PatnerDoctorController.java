package com.mima.app.doc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mima.app.session.domain.BookingVO;
import com.mima.app.session.service.BookingService;

@Controller
@RequestMapping("/docDash/*")
public class PatnerDoctorController {
	
	@Autowired BookingService bookingService;
	
	@GetMapping("docMain")
	public void docMain(Model model, BookingVO vo) {
		model.addAttribute("bookingList", bookingService.getList(vo));
//		model.addAttribute(null, model);
	}
	
	@GetMapping("apptManage")
	public void apptManage() {}

	@GetMapping("apptManageCal")
	public void apptManageCal() {}
	
}
