package com.mima.app.doc.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ClinicHoursVO {
	private int docNo;			// 의사번호
	private Date closedDate;	// 예약 불가 일
	private String closedTime;	// 예약 불가 시간
	private Date regDate;		// 등록일
	private Date editDate;		// 수정일
}
