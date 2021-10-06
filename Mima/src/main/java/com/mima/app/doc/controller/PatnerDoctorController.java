package com.mima.app.doc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mima.app.admin.domain.CscVO;
import com.mima.app.admin.service.CscService;
import com.mima.app.comments.domain.CommentsVO;
import com.mima.app.comments.service.CommentsService;
import com.mima.app.criteria.domain.Criteria;
import com.mima.app.criteria.domain.PageVO;
import com.mima.app.doc.domain.DocAvailabilityVO;
import com.mima.app.doc.service.PartnerDoctorService;
import com.mima.app.member.domain.MemberVO;
import com.mima.app.member.service.MemberService;
import com.mima.app.session.domain.BookingVO;
import com.mima.app.session.service.BookingService;

@Controller
@RequestMapping("/docDash/*")
public class PatnerDoctorController {
	
	@Autowired BookingService bookingService;
	@Autowired CommentsService commentsService;
	@Autowired CscService cscService;
	@Autowired PartnerDoctorService doctorService;
	@Autowired MemberService memberService;
	
	
	// 닥터 대쉬보드 메인 페이지_J
	@GetMapping("docMain")
	public void docMain(Model model, BookingVO bookingvo, CommentsVO commentsvo) {
		model.addAttribute("bookingList", bookingService.getList());
		model.addAttribute("getlatestapptList", bookingService.getlatestapptList());
		model.addAttribute("getlatestreviewList", commentsService.getlatestreviewList());
	}
	
	// 닥터 대쉬보드 예약관리 페이지_J
	@GetMapping("apptManage")
	public void apptManage(Model model, BookingVO bookingvo, @ModelAttribute("cri") Criteria cri) {
		int total = bookingService.apptListCount(cri);
		
		model.addAttribute("apptList", bookingService.apptList());
		model.addAttribute("apptListPage", bookingService.apptListPage(cri));
		model.addAttribute("pageMaker", new PageVO(cri, total));
	}
	
	// 닥터 대쉬보드 진료내역 페이지_J29
	@GetMapping("apptHistory")
	public void apptHistory(Model model, BookingVO bookingvo, @ModelAttribute("cri") Criteria cri) {
		int total = bookingService.apptListCount(cri);
		
		model.addAttribute("apptHistoryList", bookingService.apptHistoryList());
		model.addAttribute("apptHistoryPage", bookingService.apptHistoryPage(cri));
		model.addAttribute("pageMaker", new PageVO(cri, total));
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
	
	// 닥터 대쉬보드 프로필 페이지 수정폼_J04
	/*
	 * @GetMapping("docProfileFrom") public String docProfile() {
	 * return"docDash/docProfile"; }
	 */
	
	// 닥터 대쉬보드 패스워드 변경 페이지 수정 폼_J04
	@GetMapping("docPwChangeForm")
	public String pwUpdateForm() {
		return "docDash/docPwChange";
	}
	
	// 닥터 대쉬보드 패스워드 변경 페이지 수정 처리_J04
	@PostMapping("docPwChange")
	public String pwUpdate(RedirectAttributes rttr, MemberVO vo) {
		memberService.docPwChange(vo);
		rttr.addAttribute("pwUpdateResult", vo.getMemberId());
		return "redirect:/docPwChange";
	}
	
	// 닥터 진료노트 새창_J05
	@RequestMapping("cnote")
	public String cnote() {
		return "no/docDash/cnote";
	}

	// 닥터 처방전 새창_J06
	@RequestMapping("prescription")
	public String prescription() {
		return "/docDash/prescription";
	}
	
	/*
	 * @ModelAttribute("option") public Map<String, Object> jobs(){ Map<String,
	 * Object> map = new HashMap<String, Object>(); map.put("contentAll",
	 * jobService.getJobList()); map.put("booked", deptService.getDeptList());
	 * map.put("canceled", deptService.getDeptList()); return map; }
	 */
	
	//s:1005 docProfileInsertFrm
	@GetMapping("/docProfileInsertForm")
	public void docProfileInsertForm() {
		
	}
	
	
	// 닥터 진료가능 요일 시간 등록 폼 여는 맵핑 INSERT_J04 S:1005
	@GetMapping("/docProfileForm")
	public void docProfileFrom(Model model, DocAvailabilityVO vo) {}
	
	
	
	
}
