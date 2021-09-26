package com.mima.app.comments.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.mima.app.comments.domain.CommentsPageVO;
import com.mima.app.comments.domain.CommentsVO;
import com.mima.app.comments.service.CommentsService;
import com.mima.app.criteria.domain.Criteria;

import lombok.extern.java.Log;

@Log
@RestController
@RequestMapping("/replies/*")
public class CommentsController {
	
	@Autowired CommentsService commentsService;
	//해당 게시글의 댓글만
		@GetMapping("/")
		public CommentsPageVO getList(Criteria cri, @RequestParam int meditationNo, @RequestParam int page){
			cri.setPageNum(page);
			return CommentsService.getList(cri, bno);
		}
		
		//댓글 조회
		@GetMapping("/{rno}")
		public CommentsVO read(@PathVariable Long rno, CommentsVO vo){
			vo.setRno(rno);
		return CommentsService.read(vo);
		}
		//등록
		@PostMapping("/") //post: 파라미터 질의문자열(query string)->?id=100&pw=111&name=choi
		public CommentsVO insert(CommentsVO vo) {
			CommentsService.insert(vo);
			return vo;
		}
		
		//수정
		@PutMapping("/{rno}") //put: 파라미터가 JSON값으로 넘어옴 ->{id:100, pw:"111", name:"choi"}
		public CommentsVO update(@RequestBody CommentsVO vo) {
			CommentsService.update(vo);
			
			return CommentsService.read(vo);
		}
		//삭제
		@DeleteMapping("/{rno}") ////delete: 파라미터가 JSON값으로 넘어옴 ->{id:100, pw:"111", name:"choi"}
		public boolean delete(@PathVariable Long rno, CommentsVO vo) {
			vo.setRno(rno);
			int result = CommentsService.delete(vo);
			return result == 1 ? true: false;
		}
	
	
}
