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
	private String nickname;		//	s:1013 댓글 회원 닉네임
	private int bookingNo;//s:1019 진료리뷰 의사리뷰달기 예약번호
	
// 	K. 10/14 리뷰 회원 성별
	private String gender;
	
	// 댓글 다는 의사와 약사의 이름_J18.19
	private String name;
	private String pharmacyInfo;
	
	// 닥터 대쉬보드 나의 후기 댓글달기_J20
	private int rno;
	private int rmainNo;
	private int rwriterNo;
	private Date rregDate;
	private Date reditDate;
	private String rcontents;
	private int rcno;
	
}
