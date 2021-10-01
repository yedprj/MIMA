package com.mima.app.doc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mima.app.admin.domain.CscVO;
import com.mima.app.admin.service.CscService;
import com.mima.app.comments.domain.CommentsVO;
import com.mima.app.comments.service.CommentsService;
import com.mima.app.session.domain.BookingVO;
import com.mima.app.session.service.BookingService;

@Controller
@RequestMapping("/docDash/*")
public class PatnerDoctorController {
	
	@Autowired BookingService bookingService;
	@Autowired CommentsService commentsService;
	@Autowired CscService cscService;
	
	// 닥터 대쉬보드 메인 페이지_J
	@GetMapping("docMain")
	public void docMain(Model model, BookingVO bookingvo, CommentsVO commentsvo) {
		model.addAttribute("bookingList", bookingService.getList());
		model.addAttribute("getlatestapptList", bookingService.getlatestapptList());
		model.addAttribute("getlatestreviewList", commentsService.getlatestreviewList());
	}
	
	// 닥터 대쉬보드 예약관리 페이지_J
	@GetMapping("apptManage")
	public void apptManage(Model model, BookingVO bookingvo) {
		model.addAttribute("apptList", bookingService.apptList());
	}
	
	// 닥터 대쉬보드 진료내역 페이지_J29
	@GetMapping("apptHistory")
	public void apptHistory(Model model, BookingVO bookingvo) {
		model.addAttribute("apptHistoryList", bookingService.apptHistoryList());
	}
	
	// 닥터 대쉬보드 나의 환자들 페이지_J29
	@GetMapping("patientList")
	public void patientList() {
		
	}
	
	// 닥터 대쉬보드 나의 후기 페이지_J29
	@GetMapping("docReview")
	public void docReview(Model model, CommentsVO commentsvo) {
		model.addAttribute("docReview", commentsService.docReview());
	}
	
	@GetMapping("docQna")
	public void docQna(Model model, CscVO cscvo) {
		model.addAttribute("docQna", cscService.docQna());
	}
	
	/*
	 * @ModelAttribute("option") public Map<String, Object> jobs(){ Map<String,
	 * Object> map = new HashMap<String, Object>(); map.put("contentAll",
	 * jobService.getJobList()); map.put("booked", deptService.getDeptList());
	 * map.put("canceled", deptService.getDeptList()); return map; }
	 */
	
}
