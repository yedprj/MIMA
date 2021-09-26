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


@RestController
@RequestMapping("/replies/*")
public class CommentsController {
	
	@Autowired CommentsService commentsService;
	//해당 게시글의 댓글만
		@GetMapping("/")
		public CommentsPageVO getList(Criteria cri, CommentsVO vo, @RequestParam int page){
			cri.setPageNum(page);
			return commentsService.getList(cri, vo.getCmainCategory(), vo.getCmainNo());
		}
		
		//댓글 조회
		@GetMapping("/{cno}")
		public CommentsVO read(CommentsVO vo){
			
		return commentsService.read(vo);
		}
		//등록
		@PostMapping("/") //post: 파라미터 질의문자열(query string)->?id=100&pw=111&name=choi
		public CommentsVO insert(CommentsVO vo) {
			commentsService.insert(vo);
			return vo;
		}
		
		//수정
		@PutMapping("/{cno}") //put: 파라미터가 JSON값으로 넘어옴 ->{id:100, pw:"111", name:"choi"}
		public CommentsVO update(@RequestBody CommentsVO vo) {
			commentsService.update(vo);
			
			return commentsService.read(vo);
		}
		//삭제
		@DeleteMapping("/{cno}") ////delete: 파라미터가 JSON값으로 넘어옴 ->{id:100, pw:"111", name:"choi"}
		public boolean delete(@PathVariable int cno, CommentsVO vo) {
			vo.setCno(cno);
			int result = commentsService.delete(vo);
			return result == 1 ? true: false;
		}
	
	
}
