package com.mima.app.doc.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mima.app.admin.domain.CscVO;
import com.mima.app.admin.service.CscService;
import com.mima.app.comments.domain.CommentsVO;
import com.mima.app.comments.service.CommentsService;
import com.mima.app.criteria.domain.Criteria;
import com.mima.app.criteria.domain.PageVO;
import com.mima.app.doc.domain.DocAvailabilityVO;
import com.mima.app.doc.domain.DocInfoVO;
import com.mima.app.doc.domain.PartnerDoctorVO;
import com.mima.app.doc.service.PartnerDoctorService;
import com.mima.app.meditation.domain.MeditAttachVO;
import com.mima.app.member.domain.ExperienceVO;
import com.mima.app.member.domain.MemberBookingVO;
import com.mima.app.member.domain.MemberVO;
import com.mima.app.member.service.ExperienceService;
import com.mima.app.member.service.MemberService;
import com.mima.app.session.domain.BookingVO;
import com.mima.app.session.domain.PtInfoVO;
import com.mima.app.session.service.BookingService;

// 타일스 때문에 RequestMapping제거 p.10/06
// 타일스로 인해 아래 맵핑 해주는 클래스 String으로 수정 return으로 페이지 이동 p.10/06
// 시큐리티 권한 부여 때문에 전체적인 Mapping 수정 p.10/11
@Controller
public class PatnerDoctorController {
	
	@Autowired BookingService bookingService;
	@Autowired CommentsService commentsService;
	@Autowired CscService cscService;
	@Autowired PartnerDoctorService doctorService;
	@Autowired MemberService memberService;
	@Autowired ExperienceService experienceService;
	@Autowired private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	// 닥터 대쉬보드 메인 페이지_J
	@GetMapping("doctor/docMain")
	public String docMain(Model model, BookingVO bookingvo, CommentsVO commentsvo, HttpServletRequest request) {
		HttpSession session = request.getSession();

		MemberVO mvo = (MemberVO) session.getAttribute("session");
		
		int memberNo = mvo.getMemberNo();
		
		model.addAttribute("member", mvo);
		model.addAttribute("countGetList", bookingService.countGetList(memberNo));
		model.addAttribute("countPatientList", bookingService.countPatientList(memberNo));
		model.addAttribute("countDocReview", commentsService.countDocReview(memberNo));
		model.addAttribute("bookingList", bookingService.getList());
		model.addAttribute("getlatestapptList", bookingService.getlatestapptList());
		model.addAttribute("getlatestreviewList", commentsService.getlatestreviewList());
		
		return "docDash/docMain";
	}
	
	// 닥터 대쉬보드 예약관리 페이지_J
	@GetMapping("doctor/apptManage")
	public String apptManage(Model model, BookingVO bookingvo, @ModelAttribute("cri") Criteria cri, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("session");
		int memberNo = mvo.getMemberNo();
		
		model.addAttribute("member", mvo);
		model.addAttribute("apptList", bookingService.apptList(memberNo));
		model.addAttribute("apptListSoon", bookingService.apptListSoon(memberNo));
		model.addAttribute("apptListCanceled", bookingService.apptListCanceled(memberNo));
		
		return "docDash/apptManage";
	}
	
	// 닥터 대쉬보드 진료내역 페이지_J29
	@GetMapping("doctor/apptHistory")
	public String apptHistory(Model model, BookingVO bookingvo, @ModelAttribute("cri") Criteria cri, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("session");
		int memberNo = mvo.getMemberNo();
		
		int total = bookingService.apptHistoryCount(cri, memberNo);
		model.addAttribute("apptHistoryList", bookingService.apptHistoryList(memberNo));
		model.addAttribute("apptHistoryPage", bookingService.apptHistoryPage(cri, memberNo));
		model.addAttribute("pageMaker", new PageVO(cri, total));
    
		return "docDash/apptHistory";
	}
	
	// 닥터 대쉬보드 나의 환자들 페이지_J29. J06
	@GetMapping("doctor/patientList")
	public String patientList(Model model, MemberBookingVO memberbookingvo, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("session");
		int memberNo = mvo.getMemberNo();
	
		model.addAttribute("member", mvo);
		model.addAttribute("patientList", memberService.patientList(memberNo));
		
		return "docDash/patientList";
	}
	
	
	// 닥터 대쉬보드 나의 후기 페이지_J29
	@GetMapping("doctor/docReview")
	public String docReview(Model model, CommentsVO commentsvo) {
		model.addAttribute("docReview", commentsService.docReview());
		
		return "docDash/docReview";
	}
	
	@GetMapping("doctor/docQna")
	public String docQna(Model model, CscVO cscvo) {
		model.addAttribute("docQna", cscService.docQna());
		
		return "docDash/docQna";
	}
	
	// 닥터 대쉬보드 프로필 페이지 수정폼_J04
	/*
	 * @GetMapping("docProfileFrom") public String docProfile() {
	 * return"docDash/docProfile"; }
	 */
	
	// 닥터 대쉬보드 패스워드 변경 페이지 수정 폼_J04
	@GetMapping("doctor/docPwChangeForm")
	public String pwUpdateForm() {
		
		return "docDash/docPwChange";
	}
	
	// 닥터 대쉬보드 패스워드 변경 페이지 수정 처리_J04
	@PostMapping("doctor/docPwChange")
	@ResponseBody
	public boolean pwUpdate(MemberVO vo, HttpServletRequest request) {
		
		String password = vo.getPassword();
		String memberId = vo.getMemberId();
		MemberVO pass = memberService.findPassword1(memberId);
		
		Boolean matchPass = bCryptPasswordEncoder.matches(password, pass.getPassword()); //비교
		
		System.out.println(matchPass);
		
		return matchPass;
	}
	
	// 닥터 비밀번호 변경 p.10/11
	@PostMapping("doctor/updatePassword")
	@ResponseBody
	public int updatePassword(MemberVO vo) {
		vo.setPassword(bCryptPasswordEncoder.encode(vo.getPassword()));
		int result = memberService.updatePassword(vo);
		
		return result;
	}
	
	// 닥터 진료노트_J06. J10
	@GetMapping("doctor/cnote")
	public String getCnote(Model model,int bookingNo, PtInfoVO vo) {
		vo.setBookingNo(bookingNo);
		model.addAttribute("cnote", memberService.getCnote(vo));
		return "docDash/cnote";
	}

	// 닥터 처방전 새창_J06
	@GetMapping("doctor/prescription")
	public String prescription() {
		return "docDash/prescription";
	}
	
	
	/*
	 * @ModelAttribute("option") public Map<String, Object> jobs(){ Map<String,
	 * Object> map = new HashMap<String, Object>(); map.put("contentAll",
	 * jobService.getJobList()); map.put("booked", deptService.getDeptList());
	 * map.put("canceled", deptService.getDeptList()); return map; }
	 */
	
	
	//s:1005 docProfileInsertFrm
	@GetMapping("doctor/docProfileInsertForm")
	public String docProfileInsertForm(Model model, PartnerDoctorVO vo, MemberVO mVo, ExperienceVO expVo, DocInfoVO docVo, HttpServletRequest request ) {
		//s:1010 세션에서 의사번호 가져와서 파트너의사 테이블 검색 후 널이면 인서트 널이 아니면 수정
		
		//HttpSession session = request.getSession();
		//mVo = (MemberVO) session.getAttribute("session");
		mVo.setMemberNo(3);
		docVo = doctorService.checkDocDetail(mVo);
		System.out.println("파트너닥터컨트롤러 값이 있나 확인"+docVo);
		String path="docDash/docProfileInsertForm";
		//s:1010 만약, 파트너의사 테이블 확인 후 멤버번호가 있으면 값을 가져와서 넘겨주고 수정할 수 있도록
		if( docVo != null) {
			System.out.print("테이블에 값 잇음");
			expVo.setMemberNo(docVo.getMemberNo());
			model.addAttribute("doc", doctorService.getDocDetail(docVo));
			model.addAttribute("expList", experienceService.getExpList(expVo));
			return path;
		}else {
			//s:1010 만약, 파트너의사 테이블 확인 후 멤버번호가 없으면 바로 인서트 할 수 있도록
			System.out.print("테이블에 값 없음");
			return path;
		}
		
	}

	// S:1005 닥터 진료가능 요일 시간 등록 폼 페이지
	@GetMapping("doctor/docProfileForm")
	public String docProfileFrom(Model model, DocAvailabilityVO vo) {
		
		return "docDash/docProfileForm";
	}
		
	//s:1006 의사프로필등록
	@PostMapping("/register")
	public String register(PartnerDoctorVO vo, MemberVO mVo, ExperienceVO expVo, MultipartFile[] uploadFile, RedirectAttributes rttr) {
		System.out.println("파트너 의사 컨트롤러-> 인서트// 등록할때 보 보는거임======" + vo);
		//s:1006 파트너의사테이블에 저장
		doctorService.docProfileInsert(vo);
		
		//s:1007 멤버 테이블 주소 업데이트
		doctorService.docAddrUpdate(mVo);
		System.out.println("파트너 의사 컨트롤러-> 멤버테이블 주소 업뎃 보 보는거임======" + mVo);
		
		//s:1007 경력 테이블 인서트
		System.out.println("파트너 의사 컨트롤러-> 경력테이블 인서트 보 보는거임======" + expVo);
		experienceService.insertExp(expVo);
		
		rttr.addFlashAttribute("result", vo.getMemberNo());
		return "redirect:/docMain"; // 파라미터 전달하고 싶을 때 redirectAttr사용
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
	
	//s:1008 전체 의사 리스트 페이지로 이동
	@GetMapping("/getTotalDocList")
	public String getTotalDocList(Model model, @ModelAttribute("cri") Criteria cri) {
		int total = doctorService.totalDocNumCount(cri);
		
		model.addAttribute("list", doctorService.getTotalDocList(cri) );
		model.addAttribute("pageMaker", new PageVO(cri, total));
		
		return "/docList/getTotalDocList";
	}

	//s:1007 의사 프로필 디테일 페이지로 이동하는거
	//p.1012 return 링크 수정
	@GetMapping("/docProfileDetail")
	public String docProfileDetail(DocInfoVO vo, Model model) {
		vo = doctorService.getDocDetail(vo);
				
		model.addAttribute("item", vo);
		return "/docList/docProfileDetail";
	}
	
}
