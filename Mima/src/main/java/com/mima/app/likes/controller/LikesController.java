package com.mima.app.likes.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mima.app.likes.domain.LikesVO;
import com.mima.app.likes.service.LikesService;

@Controller
@RequestMapping("/likes/*")
public class LikesController {
	
	@Autowired LikesService likeService;
	
	// like 기록 등록
	@PostMapping("likesInsert")
	@ResponseBody
	public int likeInsert(@RequestBody LikesVO vo, Model model) {
		return  likeService.likeInsert(vo);
	}
	
	// like 기록 등록 취소
	@DeleteMapping("likesDelete")
	@ResponseBody
	public int likesDelete(@RequestBody LikesVO vo, Model model) {
		return  likeService.likeDelete(vo);
	}
	
}
