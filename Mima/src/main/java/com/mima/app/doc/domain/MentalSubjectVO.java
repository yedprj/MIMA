package com.mima.app.doc.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MentalSubjectVO {
	//s:1005 update
	private int docNo;			// 의사번호
	private String category1;	// 진료과목1
	private int price1;			// 진료금액1
	private String category2;	// 진료과목2
	private int price2;			// 진료금액2
	private String category3;	// 진료과목3
	private int price3;			// 진료금액3
	private Date regDate;		// 등록일
	private Date editDate;		// 수정일
}
