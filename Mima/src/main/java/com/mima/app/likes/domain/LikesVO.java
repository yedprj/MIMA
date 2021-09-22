package com.mima.app.likes.domain;

import java.util.Date;

import lombok.Data;

@Data
public class LikesVO {
	private int memberNo;		// 회원번호
	private Date likeDate;		// 좋아요 누른 날짜
	private String category;	// 카테고리
	private int likeMainNo;		// 좋아요 번호
}
