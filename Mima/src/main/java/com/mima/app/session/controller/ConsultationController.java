package com.mima.app.session.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mima.app.comments.domain.CommentsVO;
import com.mima.app.member.domain.MemberVO;
import com.mima.app.member.domain.PatientsVO;
import com.mima.app.member.service.PatientsService;
import com.mima.app.session.domain.BookingVO;
import com.mima.app.session.domain.ConsultationVO;
import com.mima.app.session.domain.PtInfoVO;
import com.mima.app.session.service.BookingService;
import com.mima.app.session.service.ConsultationService;

import lombok.extern.java.Log;


@Log
@CrossOrigin("https://mima.miraclemind.kro.kr:443")
@Controller
@RequestMapping("/consultation/*")
public class ConsultationController {
	
		@Autowired ConsultationService consultationService;
		//s:1003
		@Autowired BookingService bookingService;
		//s:1004
		@Autowired PatientsService patientsService;
	
		//s:1007 환자가 의사 리뷰 입력하는 폼으로 이동
		@GetMapping("/ptReviewFrm")
		public void ptReviewFrm(Model model, BookingVO vo, PtInfoVO ptVo) {
			ptVo = consultationService.getSessionInfo(vo);
			ptVo.setBookingNo(vo.getBookingNo());
			System.out.println("의사정보?"+ptVo);
			model.addAttribute("doc", ptVo);
		}
		
		//s:1015 리뷰 인서트 ajax
		@PostMapping("/ptReviewInsert")
		@ResponseBody
		public int ptReviewInsert(CommentsVO vo) {
			log.info("코멘트 보 확인"+ vo);
			//한명이 의사한명에게 리뷰 하나만 쓰게 테이블 확인
			/* vo = consultationService.checkRv(vo); */		
			int result = consultationService.ptReviewInsert(vo);
				
			return result;
		}
	
		//s:0930 진료 시작 테스트 페이지로 이동
		@GetMapping("/consultationStart2")
		public void consultationStart2(Model model, BookingVO vo) {
			model.addAttribute("bookingNo", vo);
		}
		
		//s:1003 자가검진 페이지
		@GetMapping("/preSelfAssessmentFrm")
		public void preSelfAssessment(Model model, BookingVO vo, ConsultationVO consultationVo) {
			
		}
		//s:1003 자가검진 전체 폼 섭밋 ajax2
		@PostMapping("/preSelfInfo")
		@ResponseBody
		public int preSelfInfo(@RequestBody PatientsVO vo, RedirectAttributes rttr) {
			int result = patientsService.update(vo);
			System.out.println(result+"updated");
			
			if (result == 1) {
				rttr.addFlashAttribute("result", "success");
			}
			return result;
		}
		
		//s:1003 자가검진 스트레스 문항 페이지 ajax1
		@PostMapping("/preSelfAx")
		public String preSelfAx(@RequestBody PatientsVO vo, RedirectAttributes rttr) {
			int result = patientsService.updateAx(vo);
			
			if (result == 1) {
				rttr.addFlashAttribute("result", vo.getPreSelfAx());
			}
			return "redirect:/consultation/preSelfAssessmentFrm";
		}


		//노드 화상진료에서 환자 정보 조회시
		@GetMapping("/ptInformation")
		public void ptInformation(Model model, BookingVO vo, PtInfoVO ptVo) {
	
			ptVo=consultationService.getPtInformation(vo);
			log.info("+++++++++++++"+ptVo.toString());
			model.addAttribute("pt", ptVo);
		}
	
		// s:1003 노드에서 요청해서 예약기록 조회
		@GetMapping("/getBookingInfo")
		@ResponseBody
		public BookingVO getBookingInfo(BookingVO vo, MemberVO memberSessionVo, HttpServletRequest requset) {
			vo=bookingService.getBookingInfo(vo);
			return  vo;
		}
		
		
		//s:1014 노드에서 요청, 환자의 경우 진료+의사정보 조회
		@GetMapping("/getSessionInfo")
		@ResponseBody
		public PtInfoVO getSessionInfo(PtInfoVO vo, BookingVO bookVo, HttpServletRequest requset) {
			vo=consultationService.getSessionInfo(bookVo);
			return  vo;
		}
	
		//s:1012 노드에서 요청 진료기록 저장 ajax
		@PostMapping("/consultInsertAjax")
		@ResponseBody
		public int consultInsertAjax(BookingVO vo, ConsultationVO conVo) {
			System.out.println("111노드에서 넘긴 정보" + conVo);
			
			vo.setBookingNo(conVo.getBookingNo());
			// 의사번호 가져오기
			vo = bookingService.getBookingInfo(vo);
			System.out.println("222예약 보"+vo);
			
			conVo.setDocNo(vo.getDocNo());
			System.out.println("333입력할 진료기록 정보" + conVo);
			
			int result =consultationService.consultInsert(conVo);
			
			return  result;
		}
		
		//s:1014 노드에서 요청 처방전 저장 ajax
		@GetMapping("/medInsertAjax")
		@ResponseBody
		public void medInsertAjax(ConsultationVO conVo) {
			
			System.out.println("처방전 정보 확인"+ conVo);
			int result =consultationService.medInsert(conVo);
			System.out.println("입력된 값"+result);
		}
		//s:1014 노드에서 요청 처방전 저장 ajax
		@GetMapping("/medDeliveryInsertAjax")
		@ResponseBody
		public void medDeliveryInsertAjax(ConsultationVO conVo) {
			
			System.out.println("처방전 정보 확인"+ conVo);
			int result =consultationService.medDeliveryInsert(conVo);
			System.out.println("입력된 값"+result);
		}
		
		
		//s:1025 노드호출 방번호 인서트 ajax
		@PostMapping("/rmNoInsert")
		@ResponseBody
		public int rmNoInsert(BookingVO vo) {
			log.info("예약 보 확인 방번호!"+ vo);
			
			int result = consultationService.rmNoInsert(vo);
				
			return result;
		}
		
}
