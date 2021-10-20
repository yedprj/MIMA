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
	
	// K.10/10 -- 약배달 신청정보
	private String delAddr;		// 약배달 주소
	private String delAddr2;	// 약배달 도로명 주소
	private String delAddr3;	// 약배달 상세주소
	private String delPostCode;	// 약배달 우편번호
	private String delNote;		// 약배달 특이사항
	private int delPharmacyNo;	// 약배달 신청 약국번호
	
	//e. 19 --어드민 환자정보조회
	private String name; // 이름 
	
}
