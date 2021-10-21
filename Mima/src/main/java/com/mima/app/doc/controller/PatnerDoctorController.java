package com.mima.app.doc.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Base64;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mima.app.admin.domain.CscVO;
import com.mima.app.admin.service.CscService;
import com.mima.app.comments.domain.CommentsVO;
import com.mima.app.comments.domain.ReplyVO;
import com.mima.app.comments.service.CommentsService;
import com.mima.app.criteria.domain.Criteria;
import com.mima.app.criteria.domain.PageVO;
import com.mima.app.doc.domain.DocAvailabilityVO;
import com.mima.app.doc.domain.DocInfoVO;
import com.mima.app.doc.domain.MentalSubjectVO;
import com.mima.app.doc.domain.PartnerDoctorVO;
import com.mima.app.doc.service.DocAvailabilityService;
import com.mima.app.doc.service.MentalSubjectService;
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

import lombok.extern.java.Log;



// 타일스 때문에 RequestMapping제거 p.10/06
// 타일스로 인해 아래 맵핑 해주는 클래스 String으로 수정 return으로 페이지 이동 p.10/06
// 시큐리티 권한 부여 때문에 전체적인 Mapping 수정 p.10/11
@Log
@Controller
public class PatnerDoctorController {
	
	@Autowired BookingService bookingService;
	@Autowired CommentsService commentsService;
	@Autowired CscService cscService;
	@Autowired PartnerDoctorService doctorService;
	@Autowired MemberService memberService;
	@Autowired ExperienceService experienceService;
	@Autowired private BCryptPasswordEncoder bCryptPasswordEncoder;
	@Autowired DocAvailabilityService docAvailabilityService;
	@Autowired MentalSubjectService mentalSubjectService;
	
	

	@Value("#{global['path']}")
	String path;
	
	// 닥터 대쉬보드 메인 페이지_J
	@GetMapping("doctor/docMain")
	public String docMain(Model model, BookingVO bookingvo, CommentsVO commentsvo, HttpServletRequest request) {
		HttpSession session = request.getSession();

		MemberVO mvo = (MemberVO) session.getAttribute("session");
		
		int memberNo = mvo.getMemberNo();
		model.addAttribute("member", mvo);
		model.addAttribute("clinicName", clinicName(request));
		model.addAttribute("countGetList", bookingService.countGetList(memberNo));
		model.addAttribute("countPatientList", bookingService.countPatientList(memberNo));
		model.addAttribute("countDocReview", commentsService.countDocReview(memberNo));
		model.addAttribute("bookingList", bookingService.getList(memberNo));
		model.addAttribute("getlatestapptList", bookingService.getlatestapptList(memberNo));
		model.addAttribute("getlatestreviewList", commentsService.getlatestreviewList(memberNo));
		
		return "docDash/docMain";
	}
	
	// 닥터 대쉬보드 예약관리 페이지_J
	@GetMapping("doctor/apptManage")
	public String apptManage(Model model, BookingVO bookingvo, @ModelAttribute("cri") Criteria cri, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("session");
		int memberNo = mvo.getMemberNo();
		
		int total = bookingService.apptManageCount(cri, memberNo);
		
		model.addAttribute("member", mvo);
		model.addAttribute("clinicName", clinicName(request));
		model.addAttribute("apptListPage", bookingService.apptListPage(cri, memberNo));
		model.addAttribute("apptListSoonPage", bookingService.apptListSoonPage(cri, memberNo));
		model.addAttribute("apptListCanceledPage", bookingService.apptListCanceledPage(cri, memberNo));
		model.addAttribute("pageMaker", new PageVO(cri, total));
		
		return "docDash/apptManage";
	}
	
	// 닥터 대쉬보드 진료내역 페이지_J29
	@GetMapping("doctor/apptHistory")
	public String apptHistory(Model model, BookingVO bookingvo, @ModelAttribute("cri") Criteria cri, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("session");
		int memberNo = mvo.getMemberNo();
		
		int total = bookingService.apptHistoryCount(cri, memberNo);
		
		model.addAttribute("clinicName", clinicName(request));
		model.addAttribute("apptHistoryPage", bookingService.apptHistoryPage(cri, memberNo));
		model.addAttribute("pageMaker", new PageVO(cri, total));
    
		return "docDash/apptHistory";
	}
	
	// 닥터 대쉬보드 나의 환자들 페이지_J29. J06
	@GetMapping("doctor/patientList")
	public String patientList(Model model, MemberBookingVO memberbookingvo, @ModelAttribute("cri") Criteria cri, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("session");
		int memberNo = mvo.getMemberNo();
		
		int total = memberService.patientListCount(cri, memberNo);
	
		model.addAttribute("member", mvo);
		model.addAttribute("clinicName", clinicName(request));
		model.addAttribute("patientListPage", memberService.patientListPage(cri, memberNo));
		model.addAttribute("pageMaker", new PageVO(cri, total));
		
		return "docDash/patientList";
	}
	
	
	// 닥터 대쉬보드 나의 후기 페이지_J29
	@GetMapping("doctor/docReview")
	public String docReview(Model model, CommentsVO commentsvo, ReplyVO vo, HttpServletRequest request, @ModelAttribute("cri")Criteria cri) {
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("session");
		int memberNo = mvo.getMemberNo();
		
		int total = commentsService.docReviewCount(cri, memberNo);
		
		model.addAttribute("clinicName", clinicName(request));
		/* model.addAttribute("docReview", commentsService.docReview(memberNo)); */
		if (cri.getKeyword() == null || cri.getKeyword().equals("latest")) {
			model.addAttribute("docReviewPage", commentsService.docReviewPage(cri, memberNo));
		} else {
			model.addAttribute("docReviewPage", commentsService.docReviewPageOldest(cri, memberNo));
		}
		model.addAttribute("pageMaker", new PageVO(cri,total));
		
		return "docDash/docReview";
	}
	
	// 닥터 대쉬보드 나의 후기 페이지 댓글 등록_J20
	@PostMapping("doctor/docReplyInsert")
	@ResponseBody
	public ReplyVO docReplyInsert(ReplyVO replyvo) {
		int result = commentsService.docReplyInsert(replyvo);
		ReplyVO vo = new ReplyVO();
		if ( result > 0 ) {
			vo = commentsService.getReply(replyvo.getRno());
		}
		return vo;
		
	}
	
	// 닥터 대쉬보드 나의 후기 페이지 댓글 수정_J20
	   @PostMapping("doctor/docReplyUpdate")
	   @ResponseBody
	   public ReplyVO docReplyUpdate(ReplyVO replyvo) {
	      int result = commentsService.docReplyUpdate(replyvo);
	      ReplyVO vo = new ReplyVO();
	      if ( result > 0 ) {
	         vo = commentsService.getReply(replyvo.getRno());
	      }
	      return vo;
	   }
	
	// 닥터 대쉬보드 나의 후기 페이지 댓글 삭제_J20
	@PostMapping("doctor/replyDelete")
	@ResponseBody
	public int replyDelete(ReplyVO replyvo) {
		return commentsService.docReplyDelete(replyvo);
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
	public String pwUpdateForm(Model model, HttpServletRequest request) {
		// 닥터 프로필 병원 이름 호출_J17
		model.addAttribute("clinicName", clinicName(request));
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

	// 닥터 처방전 새창_J06. J12
	@GetMapping("doctor/prescription")
	public String prescription(Model model,int bookingNo, PtInfoVO vo) {
		vo.setBookingNo(bookingNo);
		return "docDash/prescription";
	}
	
	// 닥터 대쉬보드 병원 이름_J13
	public String clinicName(HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("session");
		int memberNo = mvo.getMemberNo();
		
		String clinicName = doctorService.clinicName(memberNo);
		
		return clinicName;
	}
	
	
	//s:1005 docProfileInsertFrm
	@GetMapping("doctor/docProfileInsertForm")
	public String docProfileInsertForm(Model model, MemberVO mVo, ExperienceVO expVo, DocInfoVO docVo, HttpServletRequest request ) throws IOException {
		
		// 닥터 프로필 병원 이름 호출_J17
		model.addAttribute("clinicName", clinicName(request));

		//s:1010 세션에서 의사번호 가져와서 파트너의사 테이블 검색 후 널이면 인서트 널이 아니면 수정
		HttpSession session = request.getSession();
		mVo = (MemberVO) session.getAttribute("session");
		System.out.println(mVo);
		
		docVo = doctorService.checkDocDetail(mVo);
		System.out.println("파트너닥터컨트롤러 값이 있나 확인"+docVo);
		
		if(docVo != null) {
			expVo.setMemberNo(docVo.getMemberNo());
			model.addAttribute("doc", doctorService.getDocDetail(docVo));
			model.addAttribute("expList", experienceService.getExpList(expVo));
		}
	
		return "docDash/docProfileInsertForm";	
	}
	
	//s:1020 의사 프로필 페이지 학력조회 ajax 
	@GetMapping("doctor/getEduAjax")
	@ResponseBody
	public DocInfoVO getEduAjax(MemberVO mVo, DocInfoVO docVo, HttpServletRequest request  ) {
		//s:1010 세션에서 의사번호 가져와서 파트너의사 테이블 검색 후 널이면 인서트 널이 아니면 수정
		HttpSession session = request.getSession();
		mVo = (MemberVO) session.getAttribute("session");
		System.out.println("세션확인..."+mVo);
		docVo = doctorService.checkEduDetail(mVo);
		System.out.println("확인중..."+docVo);
		
		return docVo;
	}
	
	//s:1020  의사 프로필 페이지 학력입력 ajax 
		@PostMapping("doctor/insertEduAjax")
		@ResponseBody
		public int insertEduAjax(MemberVO mVo, PartnerDoctorVO docVo, HttpServletRequest request  ) {
			//s:1010 세션에서 의사번호 가져와서 파트너의사 테이블 검색 후 널이면 인서트 널이 아니면 수정
			HttpSession session = request.getSession();
			mVo = (MemberVO) session.getAttribute("session");
			docVo.setMemberNo(mVo.getMemberNo());
			System.out.println("입력할 학력 조회" +docVo);
					
			int result = doctorService.insertEduAjax(docVo);
			return result;
		}
		
		//s:1020  의사 프로필 페이지 학력수정 ajax 
		@PostMapping("doctor/updateEduAjax")
		@ResponseBody
		public int updateEduAjax(MemberVO mVo, PartnerDoctorVO docVo, HttpServletRequest request  ) {
			//s:1010 세션에서 의사번호 가져와서 파트너의사 테이블 검색 후 널이면 인서트 널이 아니면 수정
			HttpSession session = request.getSession();
			mVo = (MemberVO) session.getAttribute("session");
			docVo.setMemberNo(mVo.getMemberNo());
			System.out.println("입력할 학력 조회" +docVo);
					
			int result = doctorService.updateEduAjax(docVo);
			return result;
		}
		
		//s:1020 의사 프로필 페이지 경력조회 ajax 
		@GetMapping("doctor/getExpAjax")
		@ResponseBody
		public List<ExperienceVO> getExpAjax(MemberVO mVo, ExperienceVO expVo, HttpServletRequest request) {
			//s:1010 세션에서 의사번호 가져와서 파트너의사 테이블 검색 후 널이면 인서트 널이 아니면 수정
			HttpSession session = request.getSession();
			mVo = (MemberVO) session.getAttribute("session");
			expVo.setMemberNo(mVo.getMemberNo());
			System.out.println("경력확인중.."+expVo);
			return experienceService.getExpList(expVo);
		}
	
		//s:1020  의사 프로필 페이지 경력 입력 ajax 
		@PostMapping("doctor/insertExpAjax")
		@ResponseBody
		public List<ExperienceVO> insertExpAjax(@RequestBody ExperienceVO expVo, HttpServletRequest request  ) {
			
			System.out.println("입력할 경력 조회" +expVo);
					
			int result = experienceService.insertExpAjax(expVo);
			
			return experienceService.getExpList(expVo);
		}
		
		//s:1020  의사 프로필 페이지 경력 입력 ajax 
		@PostMapping("doctor/delExpAjax")
		@ResponseBody
		public int delExpAjax(@RequestBody ExperienceVO expVo, HttpServletRequest request  ) {
			
			System.out.println("경력삭제" +expVo);
					
			int result = experienceService.deleteExp(expVo);
			
			return result;
		}
	
		//s:1020  의사 프로필 페이지 경력수정 ajax 
		@PostMapping("doctor/updateExpAjax")
		@ResponseBody
		public int updateExpAjax(ExperienceVO expVo, HttpServletRequest request  ) {
			
			System.out.println("수정할 경력 조회" +expVo);
					
			int result = experienceService.updateExpAjax(expVo);
			return result;
		}

	// S:1005 닥터 진료가능 요일 시간 등록 폼 페이지
	@GetMapping("doctor/docProfileForm")
	public String docProfileFrom(Model model, MemberVO mVo, DocAvailabilityVO availVo, MentalSubjectVO subVo, HttpServletRequest request ) {
		
		//s:1017 added.
		HttpSession session = request.getSession();
		mVo = (MemberVO) session.getAttribute("session");
		
		String clinicName=doctorService.clinicName(mVo.getMemberNo());
		
		availVo = docAvailabilityService.checkAvail(mVo);
		System.out.println("checking 진료가능시간 전체"+ availVo);
		subVo = mentalSubjectService.getPriceCategory(mVo.getMemberNo());
		System.out.println("checking 진료과목 전체"+ subVo);
		
		model.addAttribute("cName", clinicName);
		model.addAttribute("time", availVo);
		model.addAttribute("sub", subVo);
  	// 닥터 프로필 병원 이름 호출_J17
		model.addAttribute("clinicName", clinicName(request));

		
		return "docDash/docProfileForm";
	}
		
	//s:1006 의사프로필등록
	@PostMapping("doctor/register")
	public String register(PartnerDoctorVO vo, MemberVO mVo, ExperienceVO expVo, MultipartFile[] uploadFile, RedirectAttributes rttr) {
		
		System.out.println("파트너 의사 컨트롤러-> 인서트// 등록할때 보 보는거임======" + vo);
		//s:1006 파트너의사테이블에 저장
		doctorService.docProfileInsert(vo);
		
		//s:1007 멤버 테이블 주소 업데이트
		doctorService.docAddrUpdate(mVo);
		System.out.println("파트너 의사 컨트롤러-> 멤버테이블 주소 업뎃 보 보는거임======" + mVo);
		
		rttr.addFlashAttribute("result", vo.getMemberNo());
		return "redirect:docMain"; // 파라미터 전달하고 싶을 때 redirectAttr사용
	}
	
	
	//s:1006 첨부파일 등록 폼---의사 프로필사진
	@PostMapping("doctor/docAjaxInsert")
	@ResponseBody
	// 업로드 폼에서 인풋에서 타입이 파일이기 때문에 멀티파트파일로 주고 그 네임을 찾아서 여기 업로드파일 변수에 담아줌
	public MeditAttachVO docAjaxInsert(MultipartFile uploadFile, MeditAttachVO vo)
			throws IllegalStateException, IOException {
		MeditAttachVO attachVo = null;

		String imgPath = path;

		MultipartFile uFile = uploadFile;
		if (!uFile.isEmpty() && uFile.getSize() > 0) {
			String filename = uFile.getOriginalFilename(); // 사용자가 업로드한 파일명

			// 파일 자체도 보안을 걸기 위해 파일이름 바꾸기도 한다. 원래 파일명과 서버에 저장된 파일이름을 따로 관리
			// String saveName = System.currentTimeMillis()+""; //이거를 팀별로 상의해서 지정해 주면 된다.
			// File file =new File("c:/upload", saveName);
			UUID uuid = UUID.randomUUID();
			File file = new File(imgPath, uuid + filename);
			System.out.println("이미지패스랑 유유아디파일"+file);
			uFile.transferTo(file);

			attachVo = new MeditAttachVO(); // attachVO list안에 파일정보 저장하기 위해 만듦
			attachVo.setPImgName(filename);
			attachVo.setUuid(uuid.toString());
			attachVo.setUploadPath(imgPath);

			System.out.println("어태치보 확인"+attachVo);
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

	//s:1007 의사 프로필 디테일 페이지로 이동하는거 s:1012
	@GetMapping("/docProfileDetail")
	public String docProfileDetail(DocInfoVO docVo, Model model, MemberVO mVo, CommentsVO comVo, ExperienceVO expVo, @ModelAttribute("cri")Criteria cri, HttpServletRequest request) {
		
		System.out.println("넘겨받은 멤버보"+mVo);
		docVo = doctorService.checkDocDetail(mVo);
		expVo.setMemberNo(mVo.getMemberNo());
		
		//s:1019 의사 리뷰 가져오기
		int mNo = mVo.getMemberNo();
		//토탈리뷰수
		int reviewTotal = commentsService.docReviewCount(cri, mNo);
		System.out.println("총 리뷰 숫자"+ reviewTotal);
		
		if(docVo !=null) {
			docVo = doctorService.getDocDetail(docVo);
			System.out.println(docVo+"보 값 확인");
			System.out.print("테이블에 값 잇음");
			List<ExperienceVO> expList = experienceService.getExpList(expVo);
			model.addAttribute("item", docVo);
			model.addAttribute("expList", expList);
			//의사리뷰리스트
			model.addAttribute("docReviewPage",  commentsService.docReviewPage(cri, mNo));
			model.addAttribute("reviewTotalNum", reviewTotal);
			model.addAttribute("pageMaker", new PageVO(cri,reviewTotal));
						
			return "/docList/docProfileDetail";
		}else {
			System.out.print("테이블에 값 없음 노노 ");
			model.addAttribute("message", "No details saved for this doctor!");
			return "/tiles/errorPage";
		}

	}
	
	//p.10.13 의사 경력 등록
	@PostMapping("docExperienceInsert")
	public int docExperienceInsert() {
		
		return 1;
	}
	
	// p.10/14 의사 진료과목에 따른 리스트 페이지
	@PostMapping("/subjectDoclist")
	public String subjectDoclist(String category1, String category2, String category3, Model model) {
		
		model.addAttribute("list", doctorService.subjectDoclist(category1, category2, category3));
		System.out.println("==========================" + category1);
		model.addAttribute("category", category1);
		
		return "/docList/getSubjectDocList";
	}
	
	//s:1021 제은이꺼 훔쳐옴 의사 리스트 프로필 이미지 불러오기
	@RequestMapping(value = "/FileDown.do")
	public void cvplFileDownload(@RequestParam Map<String, Object> commandMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		log.info("파일 다운로드 커맨드맵 이미지"+commandMap.toString());
		File uFile = new File("c:/upload/", (String)commandMap.get("fname"));
		
		long fSize = uFile.length();
		if (fSize > 0) {
			String mimetype = "application/x-msdownload";
			response.setContentType(mimetype);

			BufferedInputStream in = null;
			BufferedOutputStream out = null;
			try {
				in = new BufferedInputStream(new FileInputStream(uFile));
				out = new BufferedOutputStream(response.getOutputStream());
				FileCopyUtils.copy(in, out);
				out.flush();
			} catch (IOException ex) {
				ex.printStackTrace();
			} finally {
				in.close();
				response.getOutputStream().flush();
				response.getOutputStream().close();
			}
		} 
	}//s:1021 제은이꺼 훔쳐옴 의사 리스트 프로필 이미지 불러오기 끝
	
}
