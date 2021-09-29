package com.mima.app.admin.controller;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mima.app.admin.domain.ReportVO;
import com.mima.app.admin.domain.RmemberVO;
import com.mima.app.admin.service.ReportService;

@Controller
@RequestMapping("/report/*")
public class ReportController {
	
	@Autowired
	ReportService reportService;
	
	//e.29
	//관리자 신고당한사람 전체조회
	@GetMapping("/rplist")
	public void rplist(Model model) {
		List<RmemberVO> list = new ArrayList<RmemberVO>();
		
		list = reportService.rmemberReportSelect();
		
		model.addAttribute("list", list);
	}
	
	//e.29
	//관라자 신고당한사람 단건조회
	@GetMapping("/rpget")
	public void rpget(Model model, RmemberVO vo) {
		model.addAttribute("report",reportService.rmemberReportSelect(vo));
	}
	
	//e.29
	//관리자 신고당한사람 삭제
	@GetMapping("/rpdelete")
	public String rpdelete(RedirectAttributes rttr, @RequestParam int reportNo) {
		
		ReportVO vo = new ReportVO();
		vo.setReportNo(reportNo);
		int result = reportService.delete(vo);
		
		if(result == 1) {
			rttr.addFlashAttribute("result","success");
		}
		//rttr.addAttribute("list", reportService.rmemberReportSelect());
		return "redirect:/report/rplist";
		
	}
	
}
