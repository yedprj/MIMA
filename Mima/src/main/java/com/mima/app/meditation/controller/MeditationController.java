package com.mima.app.meditation.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mima.app.criteria.domain.Criteria;
import com.mima.app.criteria.domain.PageVO;
import com.mima.app.meditation.domain.MeditAttachVO;
import com.mima.app.meditation.domain.MeditationVO;
import com.mima.app.meditation.service.MeditAttachService;
import com.mima.app.meditation.service.MeditationService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/meditation/*")
public class MeditationController {
	
	@Autowired
	MeditationService meditationService;
	
	//To main 조회
	@GetMapping("/meditationMain")
	public void meditationMain(Model model) {
		//추천 명상 컨텐츠만 넘겨주면 됨.
		
	}
	//전체 리스트 조회
	@GetMapping("/totalList")
	public void totalList(Model model, @ModelAttribute("cri") Criteria cri) {
		int total = meditationService.getTotalMeditCount(cri);
		System.out.println("getList++++++++++++++++" + cri);
		model.addAttribute("list", meditationService.getMeditationList(cri));
		
		model.addAttribute("pageMaker", new PageVO(cri, total));
		System.out.println(new PageVO(cri, total) +"  ------------- getList++++++++++++++++" + cri);
	}
	
	
	// 단건조회-디테일 페이지
	@GetMapping("/meditationDetail")
	public void meditationDetail(Model model, MeditationVO vo, @ModelAttribute("cri") Criteria cri) {
		model.addAttribute("item", meditationService.read(vo));
	}
	
	// 등록 폼페이지
	@GetMapping("/meditationInsertForm")
	public void meditationInsertForm() {
	}
	
	//등록
	@PostMapping("/register")
	public String register(MeditationVO vo, MultipartFile[] uploadFile, RedirectAttributes rttr) {
		System.out.println("명상컨트롤 등록할때 보 보는거임======"+vo);
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

	
	//첨부파일 등록 폼---명상동영상
	@PostMapping("/meditAjaxInsert")
	@ResponseBody
	//업로드 폼에서 인풋에서 타입이 파일이기 때문에 멀티파트파일로 주고 그 네임을 찾아서 여기 업로드파일 변수에 담아줌
	public MeditAttachVO meditAjaxInsert(MultipartFile uploadFile, MeditAttachVO vo) throws IllegalStateException, IOException {
		MeditAttachVO attachVo = null;
		String path = "c:/upload";

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
	
	//명상가 사진 등록
		@PostMapping("/meditTeacherAjaxInsert")
		@ResponseBody
		//업로드 폼에서 인풋에서 타입이 파일이기 때문에 멀티파트파일로 주고 그 네임을 찾아서 여기 업로드파일 변수에 담아줌
		public MeditAttachVO meditTeacherAjaxInsert(MultipartFile uploadFile, MeditAttachVO vo) throws IllegalStateException, IOException {
			MeditAttachVO attachVo = null;
			String path = "c:/upload";

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
