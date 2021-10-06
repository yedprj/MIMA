package com.mima.app.doc.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mima.app.admin.domain.CscVO;
import com.mima.app.admin.service.CscService;
import com.mima.app.comments.domain.CommentsVO;
import com.mima.app.comments.service.CommentsService;
import com.mima.app.doc.domain.DocAvailabilityVO;
import com.mima.app.doc.domain.PartnerDoctorVO;
import com.mima.app.doc.service.PartnerDoctorService;
import com.mima.app.meditation.domain.MeditAttachVO;
import com.mima.app.meditation.domain.MeditationVO;
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
	
	// 닥터 진료노트_J05
	@RequestMapping("cnote")
	public String cnote() {
		return "no/docDash/cnote";
	}
	
	/*
	 * @ModelAttribute("option") public Map<String, Object> jobs(){ Map<String,
	 * Object> map = new HashMap<String, Object>(); map.put("contentAll",
	 * jobService.getJobList()); map.put("booked", deptService.getDeptList());
	 * map.put("canceled", deptService.getDeptList()); return map; }
	 */
	
	
	//s:1005 docProfileInsertFrm
	@GetMapping("/docProfileInsertForm")
	public void docProfileInsertForm() {}
	
	
	// 닥터 진료가능 요일 시간 등록 폼 페이지 S:1005
	@GetMapping("/docProfileForm")
	public void docProfileFrom(Model model, DocAvailabilityVO vo) {}
	
	
	//s:1006 의사프로필등록
	@PostMapping("/register")
	public String register(PartnerDoctorVO vo, MultipartFile[] uploadFile, RedirectAttributes rttr) {
		System.out.println("파트너 의사 컨트롤러-> 인서트// 등록할때 보 보는거임======" + vo);
		doctorService.docProfileInsert(vo);

		rttr.addFlashAttribute("result", vo.getMemberNo());
		return "redirect:/docDash/docMain"; // 파라미터 전달하고 싶을 때 redirectAttr사용
	}
	
	
	
	//s:1006 첨부파일 등록 폼---의사 프로필사진
	@PostMapping("/docAjaxInsert")
	@ResponseBody
	// 업로드 폼에서 인풋에서 타입이 파일이기 때문에 멀티파트파일로 주고 그 네임을 찾아서 여기 업로드파일 변수에 담아줌
	public MeditAttachVO docAjaxInsert(MultipartFile uploadFile, MeditAttachVO vo)
			throws IllegalStateException, IOException {
		MeditAttachVO attachVo = null;
		String path = "C:/upload";

		MultipartFile uFile = uploadFile;
		if (!uFile.isEmpty() && uFile.getSize() > 0) {
			String filename = uFile.getOriginalFilename(); // 사용자가 업로드한 파일명

			// 파일 자체도 보안을 걸기 위해 파일이름 바꾸기도 한다. 원래 파일명과 서버에 저장된 파일이름을 따로 관리
			// String saveName = System.currentTimeMillis()+""; //이거를 팀별로 상의해서 지정해 주면 된다.
			// File file =new File("c:/upload", saveName);
			UUID uuid = UUID.randomUUID();
			File file = new File(path, uuid + filename);
			uFile.transferTo(file);

			attachVo = new MeditAttachVO(); // attachVO list안에 파일정보 저장하기 위해 만듦
			attachVo.setPImgName(filename);
			attachVo.setUuid(uuid.toString());
			attachVo.setUploadPath(path);

			System.out.println(attachVo);
		}
		return attachVo;
	}

	
	
}
