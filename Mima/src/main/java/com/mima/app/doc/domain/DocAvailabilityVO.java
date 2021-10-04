package com.mima.app.doc.domain;

import java.util.Date;

import lombok.Data;

@Data
public class DocAvailabilityVO {
	private int docNo;		// 의사번호
	private String mon;		// 월요일
	private String tue;		// 화요일
	private String wed;		// 수요일
	private String thu;		// 목요일
	private String fri;		// 금요일
	private String sat;		// 토요일
	private String sun;		// 일요일
	private String day;
	private Date regDate;	// 등록일
	private Date editDate;	// 수정일
}
