package com.mima.app.admin.domain;

import java.util.Date;

import lombok.Data;
//신고 당한사람, 신고한 사람 전체조회
//e.30
@Data
public class RmemberVO {

	private String reportNo; //신고글 넘버
	private String postNo;  //신고당한 포스트 넘버
	private String memberNo; //신고한 회원번호
	private String reportMno; // 신고당한 회원번호
	private String rmemberId; // 신고한 회원 아이디
	private String reportId; // 신고 당한 회원 아이디
	private Date reportDate; //신고한 날짜
	private Date checkDate; //신고 확인 날짜
	private String reportResult; //신고 조치 여부
	
}
