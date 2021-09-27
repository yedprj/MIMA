package com.mima.app.admin.controller;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mima.app.admin.domain.ReportVO;
import com.mima.app.admin.domain.RmemberVO;
import com.mima.app.admin.service.ReportService;

@Controller
@RequestMapping("/report/*")
public class ReportController {
	
	@Autowired
	ReportService reportService;
	
	@GetMapping("/rplist")
	public void rplist(Model model) {
		List<RmemberVO> list = new ArrayList<RmemberVO>();
		
		list = reportService.rmemberReportSelect();
		
		model.addAttribute("list", list);
	}
	
	@GetMapping("/rpget")
	public void rpget(Model model, ReportVO vo) {
		model.addAttribute("report",reportService.adminRead(vo));
	}
	
	@GetMapping("/rpdelete")
	public String rpdelete(RedirectAttributes rttr, ReportVO vo) {
		
		int result = reportService.delete(vo);
		
		if(result ==1) {
			rttr.addAttribute("deleteResult", vo.getReportNo());
		}
		return "redirect:/report/rplist";
		
	}
	
	
	

}
