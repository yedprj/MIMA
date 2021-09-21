package com.mima.app.meditation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mima.app.meditation.service.MeditationService;

@Controller
@RequestMapping("/meditation/*")
public class MeditationController {
	
	@Autowired
	MeditationService meditationService;
	
	//전체 리스트 조회
	@GetMapping("/meditationMain")
	public void meditationMain(Model model) {
		model.addAttribute("list", meditationService.getMeditationList());
	}

	// 등록 폼페이지
	@GetMapping("/meditationInsertForm")
	public void meditationInsertForm() {
	}
	
	//등록
	@PostMapping("/register")
	public void register() {
		
	}

}
