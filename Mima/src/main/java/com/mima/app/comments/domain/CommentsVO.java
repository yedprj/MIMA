package com.mima.app.comments.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class CommentsVO {
	
	private String cmainCategory;	// 카테고리
	private int cmainNo;			// 댓글, 리뷰 번호
	private int commentWriterNo;	// 회원번호
	private String contents;		// 내용
	private int reviewPoint;		// 평점, 벌점
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date regDate;			// 등록일
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date editDate;			// 수정일
	private int cno;				//시퀀스 사용 고유번호 pk
	private String nickname;
	
}
