package com.mima.app.doc.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MentalSubjectVO {
	private int docNo;			// 의사번호
	private String category;	// 진료과목
	private int price;			// 진료금액
	private Date regDate;		// 등록일
	private Date editDate;		// 수정일
}
