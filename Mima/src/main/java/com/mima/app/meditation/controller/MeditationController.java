package com.mima.app.meditation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mima.app.meditation.service.MeditationService;

@Controller
@RequestMapping("/meditation/*")
public class MeditationController {
	
	@Autowired
	MeditationService meditationService;


	// 등록페이지
	@GetMapping("/meditationInsertForm")
	public void meditationInsertForm() {
	}


}
