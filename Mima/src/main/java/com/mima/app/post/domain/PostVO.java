package com.mima.app.post.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class PostVO {
	private int postNo;			// 포스트잇 번호
	private int memberNo;	// 회원 번호
	@DateTimeFormat(pattern = "yyyy-MM-dd")	
	private Date postDate;		// 작성일
	private String contents;	// 내용
	private int postLike;		// 좋아요 수
	private String postColor;
	//
	private int reportMno; 		// 신고내역 확인
	private int likesNo;
	
	private int startNum; // 시작하는 넘버
	private int amount; // 양
}
