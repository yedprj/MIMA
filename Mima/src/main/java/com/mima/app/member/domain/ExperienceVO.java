package com.mima.app.member.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;


//약국 의사 경력 테이블에 사용하는 보입니다. s:1007
@Data
public class ExperienceVO {
	private int expNo;
	private String title;
	private String detail;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date fromDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date toDate;
	private int memberNo;
	private Date regDate;
	private Date editDate;
}
