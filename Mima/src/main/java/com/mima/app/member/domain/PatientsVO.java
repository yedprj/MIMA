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
	
	//s:1004 --진료전 자가진단기록 위해 만든 칼럼
	private String sessionReason; //진료예약이유
	private String preDiagnosis;  //과거진단명
	private String currentMeds;	  //현재 복용중인 약
	private String moreInfo;	  //환자 본인 설명
}
