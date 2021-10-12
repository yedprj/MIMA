package com.mima.app.member.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mima.app.comments.domain.CommentsVO;
import com.mima.app.comments.service.CommentsService;
import com.mima.app.criteria.domain.Criteria;
import com.mima.app.criteria.domain.PageVO;
import com.mima.app.member.domain.MemberVO;
import com.mima.app.member.domain.PatientsVO;
import com.mima.app.member.service.MemberService;
import com.mima.app.member.service.PatientsService;
import com.mima.app.pharmacy.domain.PartnerPharmacyVO;
import com.mima.app.pharmacy.service.MedDeliveryService;
import com.mima.app.pharmacy.service.PatnerPharmacyService;
import com.mima.app.session.service.BookingService;

import lombok.extern.java.Log;


@Log
@Controller
public class PatientsController {
	
	// e.10/11 환자대쉬보드
	@Autowired PatientsService patientsService;
	
	@Autowired CommentsService commentsService;

	@Autowired BookingService bookingService; // K.10/09 booking 확인
	@Autowired PatnerPharmacyService phaService; // K.10/07 약국 검색
	@Autowired MedDeliveryService deliveryService; // K.10/09 약배달
	@Autowired MemberService memberService; // K.10/11 약배달 신청 유무


	//e.4
	//환자대쉬보드 메인 페이지
	@GetMapping("patients/ptMain")
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
	@GetMapping("patients/ptBookManage")
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
	@GetMapping("patients/ptHistory")
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
	@GetMapping("patients/ptReview")
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
	@GetMapping("patients/ptQna")
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
	
	// 환자 대쉬보드 비밀번호 변경 페이지 수정 폼 e.11
	@GetMapping("patients/ptPwChangeForm")
	public String ptPwUpdateForm() {
		
		return "patients/ptPwChange";
	}
	
	//환자 대쉬보드 비밀번호 변경 페이지 수정 처리 e.11
	@PostMapping("/ptPwChange")
	public String ptPwUpdate(RedirectAttributes rttr, MemberVO vo) {
		memberService.ptPwChange(vo);
		rttr.addAttribute("ptPwUpdateResult", vo.getMemberId());
		return "redirect:/ptPwChange";
	}
	
	//환자대쉬보드 약배달 페이지 K.10/09
	@GetMapping("patients/ptMedelivery")
	public String ptMedelivery(HttpServletRequest request, Model model) {
		String viewPage = "";
		
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("session");
		String delStatus = memberService.deliveryStatus(vo.getMemberNo());
		log.info("***** 약배달 신청유무 : "+delStatus);
		
		// + 기존 약배달 신청한건 있는지부터 조회
		PatientsVO pvo = new PatientsVO();
		if(delStatus.equals("n") ) {
			viewPage = "patients/ptMedeliveryNone";
			model.addAttribute("memberNo", vo.getMemberNo());
		}else {
			log.info("예약이 존재!");
			pvo = patientsService.ptDeliveryCheck(vo.getMemberNo());
			if(pvo == null) { // 약배달 신청정보가 없으면 등록
				model.addAttribute("memberNo", vo.getMemberNo());
				model.addAttribute("messege", "insert" );
				viewPage = "patients/ptMedelivery";
			}else {			   
				if(pvo.getDelAddr() == null) { // 환자테이블은 있으나, 약배달 정보는 x
					log.info("**********************// 환자테이블은 존재, 약배달은 x ");
					model.addAttribute("memberNo", vo.getMemberNo());
					model.addAttribute("messege", "update" );
					viewPage = "patients/ptMedelivery";
				}
				else {  // 약배달 신청정보가 있으면 수정
					log.info("**********************pvo : "+ pvo.toString());
					model.addAttribute("pvo", pvo);
					model.addAttribute("memberNo", vo.getMemberNo());
					model.addAttribute("messege", "updateBtn" );
					viewPage = "patients/ptMedelivery";
				}
			}
		}
		return viewPage;
	}
	
	//환자대쉬보드 약배달 페이지 K.10/06
	@GetMapping("patients/phaSearch")
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
	@PostMapping("ptDeliveryInsert")
	@ResponseBody
	public int ptDeliveryInsert(@RequestBody PatientsVO vo ){
		return patientsService.ptDeliveryInsert(vo);
	}
	
	//약배달 정보수정 K.10/10
	@PostMapping("ptDeliveryUpdate")
	@ResponseBody
	public int ptDeliveryUpdate(@RequestBody PatientsVO vo ){
		return patientsService.ptDeliveryUpdate(vo);
	}
	
	//약배달신청 유무 수정 K.10/11
	@PostMapping("deliberyStatusUpdate")
	@ResponseBody
	public int deliberyStatusUpdate(@RequestBody MemberVO vo){
		return memberService.deliveryStatusUpdate(vo);
	}
	
	//약국 번호로 약국명 조회 K.10/10
	@PostMapping("phaNameSearch")
	@ResponseBody
	public PartnerPharmacyVO phaNameSearch(@RequestBody PartnerPharmacyVO vo){
		return phaService.selectOne(vo.getMemberNo());
	}
	
	//s:1007 환자가 의사 리뷰 입력하는 폼으로 이동
	@GetMapping("patients/ptReviewFrm")
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
