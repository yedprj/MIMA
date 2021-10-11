package com.mima.app.admin.controller;

import org.springframework.stereotype.Controller;

@Controller
public class ReportController {
	
	/*
	 * @Autowired ReportService reportService;
	 * 
	 * //e.30 //관리자 신고당한사람 전체조회
	 * 
	 * @GetMapping("/rplist") public void rplist(Model model, @ModelAttribute("cri")
	 * Criteria cri) {
	 * 
	 * int total = reportService.getTotalCount(cri); model.addAttribute("list",
	 * reportService.getList(cri)); model.addAttribute("pageMaker", new
	 * PageVO(cri,total)); }
	 * 
	 * 
	 * //e.29 //관라자 신고당한사람 단건조회
	 * 
	 * @GetMapping("/rpget") public void rpget(Model model, RmemberVO
	 * vo, @ModelAttribute("cri") Criteria cri) {
	 * 
	 * int total = reportService.getTotalCount(cri);
	 * 
	 * model.addAttribute("report",reportService.rmemberReportSelect(vo));
	 * model.addAttribute("list", reportService.getList(cri));
	 * model.addAttribute("pageMaker", new PageVO(cri,total)); }
	 * 
	 * //e.29 //관리자 신고당한사람 삭제
	 * 
	 * @GetMapping("/rpdelete") public String rpdelete(RedirectAttributes
	 * rttr, @RequestParam int reportNo, @ModelAttribute("cri") Criteria cri) {
	 * ReportVO vo = new ReportVO(); vo.setReportNo(reportNo); int result =
	 * reportService.delete(vo);
	 * 
	 * if(result == 1) { rttr.addFlashAttribute("result","success"); }
	 * //rttr.addAttribute("list", reportService.rmemberReportSelect());
	 * rttr.addAttribute("pageNum",cri.getPageNum());
	 * rttr.addAttribute("amount",cri.getAmount());
	 * 
	 * return "redirect:/report/rplist";
	 * 
	 * }
	 */
	
}
