package com.mima.app.post.controller;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mima.app.admin.domain.ReportVO;
import com.mima.app.admin.service.ReportService;
import com.mima.app.post.domain.PostVO;
import com.mima.app.post.service.PostService;


@Controller
@RequestMapping("/post/*")
public class PostController {
	
	@Autowired PostService postService;
	@Autowired ReportService reportService;
	
	
//	//포스트잇 페이지
//	@GetMapping("post")
//	public String dept() {
//		return "post/mindPostIt";
//	}
	
	//포스트잇 페이지
	@GetMapping("/mindPostIt2")
	public void dept2() {}
	
	// ajax로 요청 : 목록, 등록, 수정, 삭제
	@GetMapping("postList")
	@ResponseBody
	public List<PostVO> postList(PostVO vo, Model model){
		return postService.getList(vo.getReportMno());
	}
	
	//등록
	@PostMapping("postInsert")
	@ResponseBody
	public int postInsert(@RequestBody PostVO vo, Model model) {
		return  postService.insert(vo);
	}
	
	//수정 처리
	@PutMapping("updateLike")
	@ResponseBody
	public int updateLike(@RequestBody PostVO vo, Model model) {
		return  postService.updateLike(vo);
	}
	
	
	//수정 처리
	@PutMapping("updateNotLike")
	@ResponseBody
	public int updateNotLike(@RequestBody PostVO vo, Model model) {
		return  postService.updateNotLike(vo);
	}

	
	//신고등록
	@PostMapping("angryUpdate")
	@ResponseBody
	public int angryUpdate(@RequestBody ReportVO vo, Model model) {
		return  reportService.insert(vo);
	}
	
	//신고 한건 확인
	@PostMapping("reportConfirm")
	@ResponseBody
	public Map<String, ReportVO> updateForm(@RequestBody ReportVO vo, Model model) {
		return Collections.singletonMap("report" , reportService.reportRead(vo)); 
	}
	
	//신고 삭제
	@DeleteMapping("delete/{reportNo}")
	@ResponseBody
	public int deleteReport(@PathVariable int reportNo, Model model) {
		ReportVO vo = new ReportVO();
		System.out.println(reportNo);
		vo.setReportNo(reportNo);
		return  reportService.delete(vo);
	}
}
