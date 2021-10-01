package com.mima.app.session.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mima.app.session.domain.BookingVO;
import com.mima.app.session.domain.PtInfoVO;
import com.mima.app.session.service.ConsultationService;

import lombok.extern.java.Log;


@Log
@Controller
@RequestMapping("/consultation/*")
public class ConsultationController {

	@Autowired ConsultationService consultationService;
	
	//s:0930 진료 시작 테스트 페이지로 이동
	@GetMapping("/consultationStart2")
	public void consultationStart2(Model model, BookingVO vo) {
		model.addAttribute("bookingNo", vo);
	}
	
	//s:0929 진료 시작 테스트 페이지로 이동
		@GetMapping("/consultationStart")
		public void consultationStart(Model model, BookingVO vo) {
			//나중에 예약 번호를 넘겨줄 거예요
		}


		//s:10/10 진료시 요청오면 환자정보 가져오기
	@GetMapping("/ptInformation")
	public void ptInformation(Model model, BookingVO vo, PtInfoVO ptVo) {
		ptVo=consultationService.getPtInformation(vo);
		model.addAttribute("pt", ptVo);
	}
	
}
