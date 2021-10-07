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

import com.mima.app.criteria.domain.Criteria;
import com.mima.app.criteria.domain.PageVO;
import com.mima.app.member.domain.MemberVO;
import com.mima.app.member.service.PatientsService;
import com.mima.app.pharmacy.domain.PartnerPharmacyVO;
import com.mima.app.pharmacy.service.PatnerPharmacyService;

@Controller
public class PatientsController {
	
	@Autowired PatientsService patientsService;
	
	// K.10/07 약국 서비스
	@Autowired PatnerPharmacyService phaService;

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
		
		model.addAttribute("ptbmList", patientsService.ptbmList(memberNo));
		model.addAttribute("getPtbmList", patientsService.getPtbmList(cri));
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
		
		model.addAttribute("ptHistoryList", patientsService.ptHistoryList(memberNo));
		model.addAttribute("getPthList", patientsService.getPthList(cri));
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
		
		model.addAttribute("ptReviewList", patientsService.ptReviewList(memberNo));
		model.addAttribute("getPtrvList", patientsService.getPtrvList(cri));
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
	public String ptMedelivery(Model model) {
	
		return "patients/ptMedelivery";
	}
	
	//환자대쉬보드 약배달 페이지 K.10/06
	@GetMapping("/phaSearch")
	public String phaSearch() {
		return "patients/phaSearch";
	}
	
	@PostMapping("pharmacy")
	@ResponseBody
	public List<PartnerPharmacyVO> pharmacy(@RequestBody Criteria cri){
		
		List<PartnerPharmacyVO> list = new ArrayList<PartnerPharmacyVO>();
		list = phaService.pharmacySearch(cri);
		
		return list;
  }
	
	//s:1007 환자가 의사 리뷰 입력하는 폼으로 이동
	@GetMapping("/ptReviewFrm")
	public String ptReviewFrm() {
		return "/patients/ptReviewFrm";

	}
	
}
