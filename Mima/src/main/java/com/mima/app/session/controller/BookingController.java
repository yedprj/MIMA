package com.mima.app.session.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mima.app.doc.domain.DocAvailabilityVO;
import com.mima.app.doc.domain.MentalSubjectVO;
import com.mima.app.doc.service.DocAvailabilityService;
import com.mima.app.doc.service.MentalSubjectService;
import com.mima.app.member.domain.MemberVO;
import com.mima.app.member.service.MemberService;
import com.mima.app.session.domain.BookingVO;
import com.mima.app.session.domain.PaymentVO;
import com.mima.app.session.service.BookingService;
import com.mima.app.session.service.RaymentService;

import lombok.extern.java.Log;

@Log
@Controller
public class BookingController {

	@Autowired MemberService memberService;
	@Autowired DocAvailabilityService docAvailabilityService;
	@Autowired BookingService bookingService;
	@Autowired MentalSubjectService mentalSubjectService;
	@Autowired RaymentService raymentService;
	
	// 결제 예약 페이지로 이동 p.01
	@GetMapping("patients/reservationForm")
	public String reservationForm(Model model) {
		
		model.addAttribute("doctors", memberService.selectDoctorY());
		
		return "booking/reservationForm";
	}
	
	// 결제 페이지 의사 검사 가능 시간 조회
	@PostMapping("patients/selectDocTime")
	@ResponseBody
	public List<String> selectDocTime(@RequestBody DocAvailabilityVO docVO) {
		System.out.println("============"+docVO.getDay());
		System.out.println("============"+docVO.getDocNo());
		String time = docAvailabilityService.selectDocTime(docVO.getDay(), docVO.getDocNo());
		List<String> list = new ArrayList<String>();
		
		if (time != null) {
			list = Arrays.asList(time.split(" "));
			log.info(list.toString());	
		} else {
			list.add("의사 선생님의 진료일이 아닙니다.");
			log.info(list.toString());
		}
		return list;
	}
	
	// 예약 등록 p.10/07
	@PostMapping("patients/reservationTime")
	@ResponseBody
	public int reservationTime(BookingVO vo) {
		
		int result = bookingService.insertBookingDate(vo);
		
		return result;
	}
	
	// 의사 카테고리 가져오기 p.10/07
	@PostMapping("patients/categorySelect")
	@ResponseBody
	public MentalSubjectVO categorySelect(@RequestParam("docNo") int docNo) {
		
		MentalSubjectVO subvo = new MentalSubjectVO();
		subvo = mentalSubjectService.categorySelect(docNo);
		
		return subvo;
	}
	
	// 결제 페이지로 이동 p.10/07
	@GetMapping("patients/paymentForm")
	public String paymentForm(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();	
		MemberVO mvo = (MemberVO) session.getAttribute("session");		
		int memberNo = mvo.getMemberNo();
		
		BookingVO bvo = new BookingVO();
		bvo = bookingService.selectBookingInfo(memberNo);	
		model.addAttribute("resvinfo", bvo);
		log.info("========================" + bvo);
		
		int docNo = bvo.getDocNo();
		
		MentalSubjectVO mentalvo = new MentalSubjectVO();
		mentalvo = mentalSubjectService.getPriceCategory(docNo);
		model.addAttribute("priceinfo", mentalvo);
		
		return "booking/paymentForm";
	}
	
	// 결제 후 이동 페이지 맵핑 수정 p.10/11
	@PostMapping("patients/insertPayment")
	@ResponseBody
	public int insertPayment(PaymentVO vo, BookingVO bvo, RedirectAttributes rttr) {
		
		int bookingNo = vo.getPayItem();
		int price = vo.getPayAmount();
		
		bvo.setBookingNo(bookingNo);
		bvo.setPrice(price);
		
		int result = raymentService.insertPayment(vo);
		
		if (result == 1) {
			bookingService.updateBookingStatus(bvo);
		}
		
		return result;
	}
}