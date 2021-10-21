package com.mima.app.member.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialException;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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

import com.mima.app.comments.domain.CommentsVO;
import com.mima.app.comments.domain.ReplyVO;
import com.mima.app.comments.service.CommentsService;
import com.mima.app.criteria.domain.Criteria;
import com.mima.app.criteria.domain.PageVO;
import com.mima.app.likes.domain.LikesVO;
import com.mima.app.meditation.domain.MeditAttachVO;
import com.mima.app.member.domain.MemberVO;
import com.mima.app.member.domain.PatientsVO;
import com.mima.app.member.service.MemberService;
import com.mima.app.member.service.PatientsService;
import com.mima.app.pharmacy.domain.MedDeliveryVO;
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

	@Value("#{global['path']}")
	String path;
	
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
		model.addAttribute("ptMyListCount", patientsService.ptMyListCount(memberNo));
		model.addAttribute("ptMyHistoryCount", patientsService.ptMyHistoryCount(memberNo));
		model.addAttribute("ptMyReviewCount", patientsService.ptMyReviewCount(memberNo));
		// 환자 약배달 현황
		model.addAttribute("ptDeliveryStatusList", patientsService.ptDeliveryStatusList(memberNo));

		return "patients/ptMain";
	}
	
	
	// K. 10/18 약 배달 현황 전체 조회
	@GetMapping("patients/ptDeliveryList")
	public String ptDeliveryList(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		MemberVO vo = (MemberVO) session.getAttribute("session");
		
		int memberNo = vo.getMemberNo();
		// 환자 약배달 현황
		model.addAttribute("ptDeliveryStatusList", patientsService.ptDeliveryStatusAllList(memberNo));
		model.addAttribute("memberNo", memberNo);

		return "patients/ptDeliveryList";
	}
	
	// K. 10/18 환자 약배달 수령완료시 상태 업데이트
	@PostMapping("patients/delcompleteUpdate")
	@ResponseBody
	public int delcompleteUpdate(MedDeliveryVO vo) {
		int result = deliveryService.delcompleteUpdate(vo);
		return result;
	}
	
	// K. 10/19 환자 약배달 재신청하기
	@PostMapping("patients/delReapply")
	@ResponseBody
	public int delReapply(MedDeliveryVO vo) {
		int result = deliveryService.delReapply(vo);
		return result;
	}
	
	// K. 10/19 환자 약배달 신청 약국 변경하기
	@PostMapping("patients/delPhaUpdate")
	@ResponseBody
	public int delPhaUpdate(PatientsVO vo) {
		int result = patientsService.delPhaUpdate(vo);
		return result;
	}
	
	// K. 10/18 환자 약배달 취소 내역 조회
	@PostMapping("patients/ptDelCancelSelect")
	@ResponseBody
	public MedDeliveryVO ptDelCancelSelect(MedDeliveryVO vo) {
		return deliveryService.delCancelReason(vo.getBookingNo());
	}
	
	
	//환자대쉬보드 예약관리 페이지 e.5
	@GetMapping("patients/ptBookManage")
	public String ptBookManage(Model model, HttpServletRequest request, @ModelAttribute("cri")Criteria cri) {
		HttpSession session = request.getSession();
		
		MemberVO vo = (MemberVO) session.getAttribute("session");
		int memberNo = vo.getMemberNo();
		
		int total = patientsService.ptbmListCount(cri, memberNo);
		
//		model.addAttribute("ptbmList", patientsService.ptbmList(memberNo, cri));
		
		if (cri.getKeyword() == null || cri.getKeyword().equals("all")) {
			model.addAttribute("ptbmListPage", patientsService.ptbmListPage(cri, memberNo));
		} else if (cri.getKeyword() == null || cri.getKeyword().equals("soon")) {
			model.addAttribute("ptbmListPage", patientsService.ptbmListSoonPage(cri, memberNo));
		} else {
			model.addAttribute("ptbmListPage", patientsService.ptbmListCanceledPage(cri, memberNo));
		}
		
		model.addAttribute("pageMaker", new PageVO(cri,total));
		
		return "patients/ptBookManage";
	}
	
	//환자대쉬보드 진료내역 페이지 e.5
	@GetMapping("patients/ptHistory")
	public String ptHistory(Model model, HttpServletRequest request, @ModelAttribute("cri")Criteria cri) {
		HttpSession session = request.getSession();
		
		MemberVO vo = (MemberVO) session.getAttribute("session");
		int memberNo = vo.getMemberNo();
		
		int total = patientsService.getTotalPthCount(memberNo, cri);
		
		if (cri.getKeyword() == null || cri.getKeyword().equals("latest")) {
			model.addAttribute("ptHistoryList", patientsService.ptHistoryList(memberNo, cri));
		} else {
			model.addAttribute("ptHistoryList", patientsService.ptHistoryOldestList(memberNo, cri));
		}
		
		System.out.println(patientsService.ptHistoryList(memberNo, cri) + "*******");
		System.out.println(patientsService.ptHistoryOldestList(memberNo, cri) + "^^^^^^^^");
		
		model.addAttribute("pageMaker", new PageVO(cri,total));
		return "patients/ptHistory";
	}
	
	//환자대쉬보드 내가 찜한 의사 e.14
	@GetMapping("patients/ptDoctor")
	public List<LikesVO> ptDoctor(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("session");
		int memberNo = vo.getMemberNo();
		List<LikesVO> list = new ArrayList<LikesVO>();
		list = patientsService.ptDoctor(memberNo);

		System.out.println("리스트 확인"+list);
		System.out.println("보 확인!!!!"+ vo);

		model.addAttribute("ptDoctorList", list);
		return list; 
		 
	}
	
	// 환자 대쉬보드 나의후기 페이지 e.5
	@GetMapping("patients/ptReview")
	public String ptReview(Model model, CommentsVO commentsvo, HttpServletRequest request, @ModelAttribute("cri")Criteria cri) {
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("session");
		int memberNo = vo.getMemberNo();
		
		int total = patientsService.getTotalPtrvCount(memberNo, cri);
		
//		model.addAttribute("ptReviewList", patientsService.ptReviewList(memberNo, cri));
		if (cri.getKeyword() == null || cri.getKeyword().equals("latest")) {
			model.addAttribute("ptReviewList", patientsService.ptReviewList(memberNo, cri));
		} else {
			model.addAttribute("ptReviewList", patientsService.ptReviewOldestList(memberNo, cri));
		}
		model.addAttribute("pageMaker", new PageVO(cri,total));
		return "patients/ptReview";
	}
	
	// 환자 대쉬보드 나의 후기 댓글 조회_J20
//	@GetMapping
//	public String ptReplySelect(Model model, CommentsVO commentsvo, HttpServletRequest request, @ModelAttribute("cri")Criteria cri) {
//		HttpSession session = request.getSession();
//		MemberVO vo = (MemberVO) session.getAttribute("session");
//		int memberNo = vo.getMemberNo();
//		
//		return null;
//		
//	}
	
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
	
	//환자대쉬보드 프로필페이지 e.12
	@GetMapping("patients/ptProfileDetail")
	public void ptMyProfile(Model model, HttpServletRequest request) throws IOException {
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("session");
		int memberNo = vo.getMemberNo();
		MemberVO membervo = patientsService.ptSelectOne(memberNo);
		
		model.addAttribute("ptMyProfile", membervo );
		
		if(membervo.getPtProfilePhoto() != null) {
			File file = new File("c:/upload",membervo.getPtProfilePhoto());
			if(! file.exists())
				return;
				
			FileInputStream inputStream = new FileInputStream(file);
			ByteArrayOutputStream byteOutStream = new ByteArrayOutputStream();
			
			int len = 0;
			byte[] buf = new byte[1024];
			while((len = inputStream.read(buf))!= -1) {
				byteOutStream.write(buf,0,len);
			}
			byte[] fileArray = byteOutStream.toByteArray();
			String s = new String (Base64.getEncoder().encodeToString(fileArray));
			
			String changeString = "data:image/"+ "png" + ";base64," + s;
			membervo.setPtProfilePhotoImg(changeString);
		}
	}
	//e.20 환자대쉬보드 Main 프로필 이미지
	@GetMapping("patients/ptProfileImg")
	public ResponseEntity<byte[]> ptProfileImg(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException, SerialException, SQLException {
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("session");
		int memberNo = vo.getMemberNo();
		MemberVO membervo = patientsService.ptSelectOne(memberNo);
		String changeString = "";
		String s = "";
		byte[] fileArray = null;
		if(membervo.getPtProfilePhoto() != null) {
			File file = new File("c:/upload",membervo.getPtProfilePhoto());
			if(! file.exists())
				return new ResponseEntity<byte[]>(null, null, HttpStatus.NOT_FOUND);
				
			FileInputStream inputStream = new FileInputStream(file);
			ByteArrayOutputStream byteOutStream = new ByteArrayOutputStream();
			
			int len = 0;
			byte[] buf = new byte[1024];
			while((len = inputStream.read(buf))!= -1) {
				byteOutStream.write(buf,0,len);
			}
			fileArray = byteOutStream.toByteArray();
			//s = new String (Base64.getEncoder().encodeToString(fileArray));
			
			//changeString = "data:image/"+ "png" + ";base64," + s;
			final HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.IMAGE_PNG);
			return new ResponseEntity<byte[]>(fileArray, headers, HttpStatus.OK);
		} else {
			return new ResponseEntity<byte[]>(null, null, HttpStatus.NOT_FOUND);
		}
		
		
	}	
	
	//e.20 환자대쉬보드 Main 프로필 이미지
	@RequestMapping(value = "/patients/FileDown.do")
	public void cvplFileDownload(@RequestParam Map<String, Object> commandMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
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
	}
	
	//환자대쉬보드 프로필 수정- e.12
	@PostMapping("patients/ptprofileUpdate")
	public String ptprofileUpdate(MemberVO vo,  Model model, HttpServletRequest request) throws IllegalStateException, IOException {

		HttpSession session = request.getSession();
		MemberVO membervo  = (MemberVO) session.getAttribute("session");
		int memberNo = membervo.getMemberNo();
		vo.setMemberNo(memberNo);
		int result = patientsService.ptprofileUpdate(vo);
		if(result == 1) {
			model.addAttribute("result","수정이 완료되었습니다.");
		}else {
			model.addAttribute("result","수정에 실패하였습니다.");
		}
		
		return "redirect:/patients/ptProfileDetail";
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
	@PostMapping("patients/pharmacy")
	@ResponseBody
	public List<PartnerPharmacyVO> pharmacy(@RequestBody Criteria cri){
		
		List<PartnerPharmacyVO> list = new ArrayList<PartnerPharmacyVO>();
		list = phaService.pharmacySearch(cri);
		
		return list;
	}
	
	//약배달 신청등록 K.10/09
	@PostMapping("patients/ptDeliveryInsert")
	@ResponseBody
	public int ptDeliveryInsert(@RequestBody PatientsVO vo ){
		return patientsService.ptDeliveryInsert(vo);
	}
	
	//약배달 정보수정 K.10/10
	@PostMapping("patients/ptDeliveryUpdate")
	@ResponseBody
	public int ptDeliveryUpdate(@RequestBody PatientsVO vo ){
		return patientsService.ptDeliveryUpdate(vo);
	}
	
	//약배달신청 유무 수정 K.10/11
	@PostMapping("patients/deliberyStatusUpdate")
	@ResponseBody
	public int deliberyStatusUpdate(@RequestBody MemberVO vo){
		return memberService.deliveryStatusUpdate(vo);
	}
	
	//약국 번호로 약국명 조회 K.10/10
	@PostMapping("patients/phaNameSearch")
	@ResponseBody
	public PartnerPharmacyVO phaNameSearch(@RequestBody PartnerPharmacyVO vo){
		return phaService.selectOne(vo.getMemberNo());
	}
	
	//s:1007 코멘트 테이블에 입력
	@PostMapping("/insert")
	public String insertReview(CommentsVO vo) {
		System.out.println("의사 리뷰 코멘트테이블입력 insert VO"+vo);
		commentsService.insert(vo);
		return  "patients/ptMain";
	}
	
	// p.10/12 예약 취소
	@PostMapping("patients/paymentCancel")
	@ResponseBody
	public int paymentCancel(int bookingNo) throws Exception {
		
		HttpURLConnection conn = null;
		URL url = new URL("https://api.iamport.kr/users/getToken");	// 엑세스 토큰을 받아올 주소 입력
		conn = (HttpURLConnection) url.openConnection();
		
		// 요청 방식 : POST
		conn.setRequestMethod("POST");
		
		// Header 설정 (application/json 형식으로 데이터를 전송)
		conn.setRequestProperty("Content-Type", "application/json");
		conn.setRequestProperty("Accept", "application/json");		// 서버로부터 받을 Data를 JSON형식 타입으로 요청함
		
		// Data 설정
		conn.setDoOutput(true);	// OutPutStream으로 POST 데이터를 넘겨주겠다는 옵션
		
		// 서버로 보낼 데이터 JSON 형태로 변환 (imp_apikey, imp_secret)
		JSONObject obj = new JSONObject();
		String impkey = "8316389304848891";
		String impSecrect = "d52aa0e1cd1dad310f9216ad6139ff15081c4bfef8f1e71dac9d9a7d4421d8107d488a22c205bd7a";
		obj.put("imp_key", impkey);
		obj.put("imp_secret", impSecrect);
		
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		bw.write(obj.toString());
		bw.flush();
		bw.close();
		
		// 서버로부터 응답 데이터 받기
		int result = 0;
		int responseCode = conn.getResponseCode();	// 응답코드 받기
		System.out.println("응답코드??" + responseCode);
		
		if (responseCode == 200) {	// 성공
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			StringBuilder sb = new StringBuilder();
			String line = null;
			while ((line = br.readLine()) != null) {
				sb.append(line + "\n");
			}
			br.close();
			
			System.out.println("" + sb.toString());
			result = 1;	// 환불 성공 시 정수값 1 반환
		} else {
			System.out.println(conn.getResponseMessage());	// 환불 실패 시 정수값 0반환 
			result = 0;
		}
		
		if (result == 1) {
			
		} 
		
		return result;
	}
	
	//e.18 환자대쉬보드 프로필 사진
	@PostMapping("patients/phaAjaxInsert")
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
