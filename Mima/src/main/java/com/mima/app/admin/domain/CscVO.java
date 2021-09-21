package com.mima.app.admin.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class CscVO {
	
	private int csNo;			// 문의글 번호
	private int memberNo;		// 문의자 번호
	private String csTitle;		// 문의글 제목
	@DateTimeFormat(pattern = "yyyy/MM/dd")	
	private Date csDate;		// 문의글 작성일
	private String csAnswer;	// 답변
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date csaDate;		// 답변 등록일
	private String csEditDate;	// 문의글 수정일
}
