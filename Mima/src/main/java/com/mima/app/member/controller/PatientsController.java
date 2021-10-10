package com.mima.app.member.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mima.app.comments.domain.CommentsVO;
import com.mima.app.comments.service.CommentsService;
import com.mima.app.criteria.domain.Criteria;
import com.mima.app.criteria.domain.PageVO;
import com.mima.app.member.domain.MemberVO;
import com.mima.app.member.service.PatientsService;
import com.mima.app.pharmacy.domain.MedDeliveryVO;
import com.mima.app.pharmacy.domain.PartnerPharmacyVO;
import com.mima.app.pharmacy.service.MedDeliveryService;
import com.mima.app.pharmacy.service.PatnerPharmacyService;
import com.mima.app.session.domain.BookingVO;
import com.mima.app.session.service.BookingService;

@Controller
public class PatientsController {
	
	@Autowired PatientsService patientsService;
	@Autowired CommentsService commentsService;
	// K.10/07 약국 서비스
	@Autowired PatnerPharmacyService phaService;
	// K.10/09 약배달
	@Autowired MedDeliveryService deliveryService;
	// K.10/09 booking 확인
	@Autowired BookingService bookingService;


	//e.4
	//환자대쉬보드 메인 페이지
	@GetMapping("/ptMain")
	public String ptMain(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		MemberVO vo = (MemberVO) session.getAttribute("session");
		
		int memberNo = vo.getMemberNo();
		
		model.addAttribute("list", patientsService.ptgetList(memberNo));
		model.addAttribute("ptMainhisList", patientsService.ptMainhisList(memberNo));
		model.addAttribute("ptMainreList", patientsService.ptMainreList(memberNo));
		return "patients/ptMain";
	}
	
	//환자대쉬보드 예약관리 페이지 e.5
	@GetMapping("/ptBookManage")
	public String ptBookManage(Model model, HttpServletRequest request, @ModelAttribute("cri")Criteria cri) {
		HttpSession session = request.getSession();
		
		MemberVO vo = (MemberVO) session.getAttribute("session");
		int memberNo = vo.getMemberNo();
		
		int total = patientsService.getTotalPtbmCount(cri);
		
		model.addAttribute("ptbmList", patientsService.ptbmList(memberNo, cri));
		model.addAttribute("pageMaker", new PageVO(cri,total));
		return "patients/ptBookManage";
	}
	
	//환자대쉬보드 진료내역 페이지 e.5
	@GetMapping("/ptHistory")
	public String ptHistory(Model model, HttpServletRequest request, @ModelAttribute("cri")Criteria cri) {
		HttpSession session = request.getSession();
		
		MemberVO vo = (MemberVO) session.getAttribute("session");
		int memberNo = vo.getMemberNo();
		
		int total = patientsService.getTotalPthCount(cri);
		
		model.addAttribute("ptHistoryList", patientsService.ptHistoryList(memberNo, cri));
		model.addAttribute("pageMaker", new PageVO(cri,total));
		return "patients/ptHistory";
	}
	
	//환자대쉬보드 나의후기 페이지 e.5
	@GetMapping("/ptReview")
	public String ptReview(Model model, HttpServletRequest request, @ModelAttribute("cri")Criteria cri) {
		HttpSession session = request.getSession();
		
		MemberVO vo = (MemberVO) session.getAttribute("session");
		int memberNo = vo.getMemberNo();
		
		int total = patientsService.getTotalPtrvCount(cri);
		
		model.addAttribute("ptReviewList", patientsService.ptReviewList(memberNo, cri));
		model.addAttribute("pageMaker", new PageVO(cri,total));
		return "patients/ptReview";
	}
	
	//환자대쉬보드 나의문의 페이지 e.6
	@GetMapping("/ptQna")
	public String ptQna(Model model, HttpServletRequest request, @ModelAttribute("cri")Criteria cri) {
		HttpSession session = request.getSession();
		
		MemberVO vo = (MemberVO) session.getAttribute("session");
		int memberNo = vo.getMemberNo();
		
		int total = patientsService.getTotalPtqCount(cri);
		
		model.addAttribute("ptQna", patientsService.ptQna(memberNo));
		model.addAttribute("getPtqList", patientsService.getPtqList(cri));
		model.addAttribute("pageMaker", new PageVO(cri,total));
		return "patients/ptQna";
	}
	
	//환자대쉬보드 약배달 페이지 K.10/06
	@GetMapping("/ptMedelivery")
	public String ptMedelivery(HttpServletRequest request, Model model) {
		// + 기존 약배달 신청한건 있는지부터 조회
		String viewPage = "";
		
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("session");
		int memberNo = vo.getMemberNo();
		
		// booking 확인하기
		BookingVO bvo = new BookingVO();
		bvo = bookingService.selectBookingInfo(memberNo);
		MedDeliveryVO medBvo = new MedDeliveryVO();
		medBvo = deliveryService.selectOne(bvo.getBookingNo());
		if(bvo == null) {
			viewPage = "patients/ptMedeliveryNone";
		}
		else {
			viewPage = "patients/ptMedelivery";
			if(medBvo == null ) {
				model.addAttribute("bookingNo", bvo.getBookingNo());
			}else {
				model.addAttribute("medBvo", medBvo);
			}
		}
		
		return viewPage;
	}
	
	//환자대쉬보드 약배달 페이지 K.10/06
	@GetMapping("/phaSearch")
	public String phaSearch() {
		return "patients/phaSearch";
	}
	
	
	//약국 찾기 K.10/07
	@PostMapping("pharmacy")
	@ResponseBody
	public List<PartnerPharmacyVO> pharmacy(@RequestBody Criteria cri){
		
		List<PartnerPharmacyVO> list = new ArrayList<PartnerPharmacyVO>();
		list = phaService.pharmacySearch(cri);
		
		return list;
	}
	
	//약배달 신청등록 K.10/09
	@PostMapping("medDeliveryAdd")
	@ResponseBody
	public int pharmacy(@RequestBody MedDeliveryVO vo ){
		return deliveryService.deliveryInsert(vo);
	}
	
	//s:1007 환자가 의사 리뷰 입력하는 폼으로 이동
	@GetMapping("/ptReviewFrm")
	public String ptReviewFrm() {
		return "patients/ptReviewFrm";
	}
	
	//s:1007 코멘트 테이블에 입력
	@PostMapping("/insert")
	public String insertReview(CommentsVO vo) {
		System.out.println("의사 리뷰 코멘트테이블입력 insert VO"+vo);
		commentsService.insert(vo);
		return  "patients/ptMain";
	}

}
