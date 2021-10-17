package com.mima.app.doc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mima.app.doc.domain.MentalSubjectVO;
import com.mima.app.doc.service.MentalSubjectService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/subject/*")
public class MentalSubjectController {
	
	@Autowired MentalSubjectService mentalSubjectService;
	
	//s:1005
	//ajax 진료목록 가격 인서트
		@PostMapping("/insertSub")
		@ResponseBody
		public int docProfileInsert(Model model, MentalSubjectVO vo) {
			int result = mentalSubjectService.insert(vo);
			if(result == 1) {
				model.addAttribute("msg", "success");
			}
			return 1;
		}
		
		//s:1017
		//ajax 진료목록 가격 update
			@PostMapping("/updateSub")
			@ResponseBody
			public int docProfileUpdate(Model model, MentalSubjectVO vo) {
				int result = mentalSubjectService.update(vo);
				if(result == 1) {
					model.addAttribute("msg", "success");
				}
				return 1;
			}	
}
