package com.mima.app.doc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mima.app.doc.domain.DocAvailabilityVO;
import com.mima.app.doc.service.DocAvailabilityService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/docAvail/*")
public class DocAvailabilityController {

	@Autowired DocAvailabilityService docAvailabilityService;
	
	//ajax 진료가능 요일시간 인서트
	@PostMapping("/insertAvailable")
	@ResponseBody
	public int docProfileInsert(Model model, DocAvailabilityVO vo) {
		System.out.println("doc doc doc"+vo.toString());
		int result = docAvailabilityService.insert(vo);
		if(result == 1) {
			model.addAttribute("msg", "success");
		}
		return 1;
	}
	
	//s:1017 ajax 진료가능 요일시간 update
		@PostMapping("/updateAvail")
		@ResponseBody
		public int docProfileUpdate(Model model, DocAvailabilityVO vo) {
			System.out.println("avail update"+vo.toString());
			int result = docAvailabilityService.update(vo);
			if(result == 1) {
				model.addAttribute("msg", "success");
			}
			return 1;
		}
	
}
