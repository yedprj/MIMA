package com.mima.app.meditation.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String register(MeditationVO vo, RedirectAttributes rttr) {
		System.out.println("register vo check================="+vo);
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

}
