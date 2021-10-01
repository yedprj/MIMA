package com.mima.app.admin.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ReportVO {

	private Integer reportNo;			// 신고 기록 번호
	private Integer postNo;				// 신고 당한 원글 번호
	private Integer memberNo;			// 신고 당한 회원 번호
	private Integer reportMno;			// 신고 한 회원번호
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date reportDate;		// 신고일
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date checkDate;			// 신고 확인일
	private String reportResult;	// 신고 조치 여부
}
