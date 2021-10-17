package com.mima.app.doc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
			
			
		//s:1017 진료과목페이지
		@GetMapping("/analysis")
		public void analysis() {}
		
		//s:1017 진료과목페이지
		@GetMapping("/addic")
		public void addic() {}
		
		//s:1017 진료과목페이지
		@GetMapping("/dd")
		public void dd() {}
		
		//s:1017 진료과목페이지
		@GetMapping("/emotion")
		public void emotion() {}
		
		//s:1017 진료과목페이지
		@GetMapping("/geri")
		public void geri() {}
		
		//s:1017 진료과목페이지
		@GetMapping("/neurosis")
		public void neurosis() {}
		
		//s:1017 진료과목페이지
		@GetMapping("/stress")
		public void stress() {}
		
		//s:1017 진료과목페이지
		@GetMapping("/work")
		public void work() {}
			
			
			
}
