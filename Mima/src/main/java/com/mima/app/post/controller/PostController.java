package com.mima.app.post.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mima.app.post.domain.PostVO;
import com.mima.app.post.service.PostService;

@Controller
@RequestMapping("/post/*")
public class PostController {
	
	@Autowired PostService postService;
	
	
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
	public List<PostVO> postList(){
		return postService.getList();
	}
	
	//등록
	@PostMapping("postInsert")
	@ResponseBody
	public int postInsert(@RequestBody PostVO vo, Model model) {
		return  postService.insert(vo);
	}
	

}
