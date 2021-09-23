package com.mima.app.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mima.app.member.domain.PatientsVO;
import com.mima.app.member.service.PatientsService;


@Controller
@RequestMapping("/patients/*")
public class PatientsController {
	
	@Autowired
	PatientsService patientsService;
	
	@GetMapping("/list")
	public String list(Model model) {
		model.addAttribute("list",patientsService.getList());
		return "admin/adlist";
	}
	
	@GetMapping("/get")
	public void get(Model model, PatientsVO vo) {
		model.addAttribute("patients",patientsService.read(vo));
	}
	
	@GetMapping("/insert")
	public void insertForm() {
		
	}
	
	@PostMapping("/insert")
	public String insert(RedirectAttributes rttr, PatientsVO vo) {
		patientsService.insert(vo);
		rttr.addAttribute("insertResult",vo.getMemberNo());
		
		return "redirect:/patients/list";
	}
	
	@GetMapping("/update")
	public void updateForm(Model model, PatientsVO vo) {
		model.addAttribute("patients", patientsService.read(vo));
	}
	
	@PostMapping("/update")
	public String update(RedirectAttributes rttr, PatientsVO vo) {
		patientsService.update(vo);
		rttr.addAttribute("updateResult",vo.getMemberNo());
		
		return "redirect:/patients/list";
	}
	
	@GetMapping("/delete")
	public String delete(RedirectAttributes rttr, PatientsVO vo) {
		int result = patientsService.delete(vo);
		
		if(result==1) {
			rttr.addAttribute("deleteResult", vo.getMemberNo());
		}
		
		return "redirect:/patients/list";
	}

}
