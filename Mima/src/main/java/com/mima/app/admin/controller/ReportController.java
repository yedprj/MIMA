package com.mima.app.admin.controller;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mima.app.admin.domain.ReportVO;
import com.mima.app.admin.domain.RmemberVO;
import com.mima.app.admin.service.ReportService;
import com.mima.app.criteria.domain.Criteria;
import com.mima.app.criteria.domain.PageVO;

@Controller
@RequestMapping("/report/*")
public class ReportController {
	
	@Autowired
	ReportService reportService;
	
	//e.30
	//관리자 신고당한사람 전체조회
	@GetMapping("/rplist")
	public void rplist(Model model, @ModelAttribute("cri") Criteria cri) {
			
		if(cri == null) {
			//처음 페이지 들어간 경우
			List<RmemberVO> list = new ArrayList<RmemberVO>();
			list = reportService.rmemberReportSelectList();
			model.addAttribute("list", list);
		}else{
			//페이지 눌러서 들어간 경우
			model.addAttribute("list", reportService.getList(cri));
			int total =  reportService.getTotalCount(cri);
			model.addAttribute("pageMaker", new PageVO(cri,total));
		}
	}
	
	//e.29
	//관라자 신고당한사람 단건조회
	@GetMapping("/rpget")
	public void rpget(Model model, RmemberVO vo, @ModelAttribute("cri") Criteria cri) {
		
		int total =  reportService.getTotalCount(cri);
		
		model.addAttribute("report",reportService.rmemberReportSelect(vo));
		model.addAttribute("list", reportService.getList(cri));
		model.addAttribute("pageMaker", new PageVO(cri,total));
	}
	
	//e.29
	//관리자 신고당한사람 삭제
	@GetMapping("/rpdelete")
	public String rpdelete(RedirectAttributes rttr, @RequestParam int reportNo, @ModelAttribute("cri") Criteria cri) {
		ReportVO vo = new ReportVO();
		vo.setReportNo(reportNo);
		int result = reportService.delete(vo);
		
		if(result == 1) {
			rttr.addFlashAttribute("result","success");
		}
		//rttr.addAttribute("list", reportService.rmemberReportSelect());
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		return "redirect:/report/rplist";
		
	}
	
}
