package com.mima.app.meditation.controller;

import java.io.File;
import java.io.IOException;
import java.util.Optional;
import java.util.UUID;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mima.app.criteria.domain.Criteria;
import com.mima.app.criteria.domain.PageVO;
import com.mima.app.meditation.domain.MeditAttachVO;
import com.mima.app.meditation.domain.MeditationVO;
import com.mima.app.meditation.service.MeditationService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/meditation/*")
public class MeditationController {

	@Autowired
	MeditationService meditationService;

	
	
	//수정 처리 - 좋아요
	@PutMapping("/updateLike")
	@ResponseBody
	public int updateLike(@RequestBody MeditationVO vo, Model model) {
		return  meditationService.updateLike(vo);
	}

	//수정 처리 - 좋아요 취소
	@PutMapping("/updateNotLike")
	@ResponseBody
	public int updateNotLike(@RequestBody MeditationVO vo, Model model) {
		return  meditationService.updateNotLike(vo);
	}
	
	
	// To main 조회
	@GetMapping("/meditationMain")
	public void meditationMain(Model model) {
		// 추천 명상 컨텐츠만 넘겨주면 됨.

	}
	
	// about medit
		@GetMapping("/aboutMedit")
		public void aboutMedit(Model model) {
			// 추천 명상 컨텐츠만 넘겨주면 됨.
		}

	// 전체 리스트 조회
	@GetMapping("/totalList")
	public void totalList(Model model, @ModelAttribute("cri") Criteria cri) {
		int total = meditationService.getTotalMeditCount(cri);
		model.addAttribute("list", meditationService.getMeditationList(cri));

		model.addAttribute("pageMaker", new PageVO(cri, total));
		System.out.println(new PageVO(cri, total) + "----- getList++++++" + cri);
	}

	// 단건조회-디테일 페이지
	@GetMapping("/meditationDetail")
	public void meditationDetail(Model model, MeditationVO vo, @ModelAttribute("cri") Criteria cri) {
		vo = meditationService.read(vo);
		String uuid = vo.getAttachFile().getUuid();
		String name = vo.getAttachFile().getVFileName();
		vo.setFileName(uuid + name);
		System.out.println(vo.getFileName());

		model.addAttribute("item", vo);
	}

	// 등록 폼페이지
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
	public MeditAttachVO meditAjaxInsert(MultipartFile uploadFile, MeditAttachVO vo)
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
			attachVo.setVFileName(filename);
			attachVo.setUuid(uuid.toString());
			attachVo.setUploadPath(path);

			System.out.println(attachVo);
		}
		return attachVo;
	}

	

	@GetMapping(value = "/video/{name}")
	public ResponseEntity<ResourceRegion> getVideo(@RequestHeader HttpHeaders headers, @PathVariable String name)
			throws IOException {
		log.info("VideoController.getVideo");
		UrlResource video = new UrlResource("file:c:/upload/" + name + ".mp4");
		System.out.println(video+"명상컨트롤러 비디오");
		ResourceRegion resourceRegion;
		final long chunkSize = 1000000L;
		long contentLength = video.contentLength();
		Optional<HttpRange> optional = headers.getRange().stream().findFirst();
		HttpRange httpRange;
		if (optional.isPresent()) {
			httpRange = optional.get();
			long start = httpRange.getRangeStart(contentLength);
			long end = httpRange.getRangeEnd(contentLength);
			long rangeLength = Long.min(chunkSize, end - start + 1);
			resourceRegion = new ResourceRegion(video, start, rangeLength);
		} else {
			long rangeLength = Long.min(chunkSize, contentLength);
			resourceRegion = new ResourceRegion(video, 0, rangeLength);
		}
		return ResponseEntity.status(HttpStatus.PARTIAL_CONTENT)
				.contentType(MediaTypeFactory.getMediaType(video).orElse(MediaType.APPLICATION_OCTET_STREAM))
				.body(resourceRegion);
	}

}
