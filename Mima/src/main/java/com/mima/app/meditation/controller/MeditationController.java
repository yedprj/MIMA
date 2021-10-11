package com.mima.app.meditation.controller;

import java.io.IOException;
import java.util.Optional;

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
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mima.app.criteria.domain.Criteria;
import com.mima.app.criteria.domain.PageVO;
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
	public void meditationMain(Model model, @ModelAttribute("cri") Criteria cri) {
		int total = meditationService.getTotalMeditCount(cri);
		
		model.addAttribute("pageMaker", new PageVO(cri, total));
		model.addAttribute("list", meditationService.randomMeditList());

	}
	
	// about medit
		@GetMapping("/aboutMedit")
		public void aboutMedit(Model model,@ModelAttribute("cri") Criteria cri) {
			int total = meditationService.getTotalMeditCount(cri);
			
			model.addAttribute("pageMaker", new PageVO(cri, total));
			model.addAttribute("list", meditationService.randomMeditList());
		}

	// 전체 리스트 조회
	@GetMapping("/totalList")
	public void totalList(Model model, @ModelAttribute("cri") Criteria cri) {
		int total = meditationService.getTotalMeditCount(cri);
		
		model.addAttribute("list", meditationService.getMeditationList(cri));
		model.addAttribute("pageMaker", new PageVO(cri, total));
	}

	// 단건조회-디테일 페이지
	@GetMapping("/meditationDetail")
	public void meditationDetail(Model model, MeditationVO vo, @ModelAttribute("cri") Criteria cri) {
		System.out.println("before call read"+vo);
		vo = meditationService.read(vo);
		System.out.println("after call read"+vo);
		String uuid = vo.getAttachFile().getUuid();
		String name = vo.getAttachFile().getVFileName();
		vo.setFileName(uuid + name);
		System.out.println(vo.getFileName());

		model.addAttribute("item", vo);
	}
	
	// 디테일 페이지에서 사용
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
