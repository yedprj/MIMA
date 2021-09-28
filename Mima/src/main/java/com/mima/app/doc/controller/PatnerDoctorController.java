package com.mima.app.doc.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mima.app.comments.domain.CommentsVO;
import com.mima.app.comments.service.CommentsService;
import com.mima.app.session.domain.BookingVO;
import com.mima.app.session.service.BookingService;

@Controller
@RequestMapping("/docDash/*")
public class PatnerDoctorController {
	
	@Autowired BookingService bookingService;
	@Autowired CommentsService commentsService;
	
	@GetMapping("docMain")
	public void docMain(Model model, BookingVO bookingvo, CommentsVO commentsvo) {
		model.addAttribute("bookingList", bookingService.getList());
		model.addAttribute("getlatestapptList", bookingService.getlatestapptList());
		model.addAttribute("getlatestreviewList", commentsService.getlatestreviewList());
	}
	
	@GetMapping("apptManage")
	public void apptManage(Model model, BookingVO bookingvo) {
		model.addAttribute("apptList", bookingService.apptList());
	}
	
	@GetMapping("apptHistory")
	public void apptHistory(Model model, BookingVO bookingvo) {
		model.addAttribute("apptHistory");
	}
	
	/*
	 * @ModelAttribute("option") public Map<String, Object> jobs(){ Map<String,
	 * Object> map = new HashMap<String, Object>(); map.put("contentAll",
	 * jobService.getJobList()); map.put("booked", deptService.getDeptList());
	 * map.put("canceled", deptService.getDeptList()); return map; }
	 */
	
}
