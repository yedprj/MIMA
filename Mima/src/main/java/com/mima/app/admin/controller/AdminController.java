package com.mima.app.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.Optional;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.UrlResource;
import org.springframework.core.io.support.ResourceRegion;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpRange;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.MediaTypeFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mima.app.admin.domain.ReportVO;
import com.mima.app.admin.domain.RmemberVO;
import com.mima.app.admin.service.ReportService;
import com.mima.app.criteria.domain.Criteria;
import com.mima.app.criteria.domain.PageVO;
import com.mima.app.meditation.domain.MeditAttachVO;
import com.mima.app.meditation.domain.MeditationVO;
import com.mima.app.meditation.service.MeditationService;
import com.mima.app.member.domain.MemberVO;
import com.mima.app.member.service.MemberService;
import com.mima.app.member.service.PatientsService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Autowired MemberService memberService;
	@Autowired PatientsService patientsService;
	// 시큐리티 때문에 추가 p.10/11
	@Autowired ReportService reportService;
	@Autowired MeditationService meditationService;
	
	//e.29
	//K 10/06 수정
	//관리자 회원정보조회(환자,의사,약국)
	@GetMapping("/adlist")
	public String list(Model model, @ModelAttribute("cri") Criteria cri) {
		int total = patientsService.getTotalPatientsCount(cri);
		int total1 = patientsService.getTotaldoctorCount(cri);
		int total2 = patientsService.getTotalpharCount(cri);
		
		model.addAttribute("getptList", patientsService.getptList());
		model.addAttribute("getdocList", patientsService.getdocList());
		model.addAttribute("getpmList", patientsService.getpmList());
		
		model.addAttribute("getPatientsList",patientsService.getPatientsList(cri));
		model.addAttribute("getdoctorList", patientsService.getdoctorList(cri));
		model.addAttribute("getpharList", patientsService.getpharList(cri));
		model.addAttribute("pageMaker", new PageVO(cri,total));
		return "admin/adlist";
	}
	
	//e.29
	//관리자 메인페이지
	@GetMapping("/adMain")
	public String adMain(Model model) { 
		
		//관리자 회원정보조회 토탈카운트 e.13
		model.addAttribute("getTotalCount",patientsService.getTotalCount());
				
		return "admin/adMain";
	}
	
	//e.29
	// 파트너 의사 / 약국 승인 유무 검색
	@GetMapping("/patnerStatusSelect")
	public String patnerStatusSelect(Model model) {
		model.addAttribute("patnerStatusSelect",memberService.patnerStatusSelect());
		return "admin/patnerStatusSelect";
	}
		
	//e.29
	// 파트너 의사 / 약국 승인 등록
	@PostMapping("/patnerStatusUpdate")
	@ResponseBody
	public int patnerStatusUpdate(MemberVO vo) {
		System.out.println(vo.getLicense());
		int result = memberService.patnerStatusUpdate(vo);
		
		return result;	
	}
	
	//e.30
	//관리자 신고당한사람 전체조회
	@GetMapping("/rplist")
	public void rplist(Model model, @ModelAttribute("cri") Criteria cri) {
		
			int total =  reportService.getTotalCount(cri);
			model.addAttribute("list", reportService.getList(cri));
			model.addAttribute("pageMaker", new PageVO(cri,total));
	}
	
	
	//e.29
	//관라자 신고당한사람 단건조회
	@GetMapping("/rpget")
	public void rpget(Model model, RmemberVO vo, @ModelAttribute("cri") Criteria cri) {
		
		int total =  reportService.getTotalCount(cri);
		
		model.addAttribute("report",reportService.rmemberReportSelect(vo));
		model.addAttribute("list", reportService.getList(cri));
		model.addAttribute("pageMaker", new PageVO(cri,total));
	}
	
	//e.29
	//관리자 신고당한사람 삭제
	@GetMapping("/rpdelete")
	public String rpdelete(RedirectAttributes rttr, @RequestParam int reportNo, @ModelAttribute("cri") Criteria cri) {
		ReportVO vo = new ReportVO();
		vo.setReportNo(reportNo);
		int result = reportService.adminDelete(vo);
		
		if(result == 1) {
			rttr.addFlashAttribute("result","success");
		}
		//rttr.addAttribute("list", reportService.rmemberReportSelect());
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		
		return "redirect:/admin/rplist";
		
	}
	
	// 명상 등록 페이지로 시큐리티를 위해 컨트롤러 수정 p.10/11
	@GetMapping("/meditationInsertForm")
	public void meditationInsertForm() {
	}
	
	// 등록
	@PostMapping("/register")
	public String register(MeditationVO vo, MultipartFile[] uploadFile, RedirectAttributes rttr) {
		System.out.println("명상컨트롤 등록할때 보 보는거임======" + vo);
		meditationService.insert(vo);

		rttr.addFlashAttribute("result", vo.getMeditationNo());
		return "redirect:/meditation/meditationMain"; // 파라미터 전달하고 싶을 때 redirectAttr사용
	}

	@GetMapping("/delete")
	public String delete(MeditationVO vo, RedirectAttributes rttr) {
		int result = meditationService.delete(vo);
		if (result == 1) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/meditation/meditationMain";
	}
		
	// 첨부파일 등록 폼---명상동영상
	@PostMapping("/meditAjaxInsert")
	@ResponseBody
	// 업로드 폼에서 인풋에서 타입이 파일이기 때문에 멀티파트파일로 주고 그 네임을 찾아서 여기 업로드파일 변수에 담아줌
	public MeditAttachVO meditAjaxInsert(MultipartFile uploadFile, MeditAttachVO vo, HttpServletRequest request)
			throws IllegalStateException, IOException {
		MeditAttachVO attachVo = null;
		String path =  request.getSession().getServletContext().getRealPath("/WEB-INF/resources/meditVideo");;

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
			attachVo.setVFileName(filename);
			attachVo.setUuid(uuid.toString());
			attachVo.setUploadPath(path);

			System.out.println(attachVo);
		}
		return attachVo;
	}
}

