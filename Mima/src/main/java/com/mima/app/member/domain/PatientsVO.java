package com.mima.app.member.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PatientsVO {
	private int memberNo;		// 환자번호
	private String pastHx;		// 과거진료기록 히스토리
	private String preSelfAx;	// 자가진단문진표
	private String topic; 		// 관심진료분야
	private String medDelivery;	// 약배달유무
	private Date regDate;		// 등록일
	private Date editDate;		// 수정일
}
