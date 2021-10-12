package com.mima.app.session.domain;


import java.util.Date;

import lombok.Data;

//s: 10/01 의사가 진료 볼 때 환자 정보 조회 버튼 누를 때 사용하는 보임

@Data
public class PtInfoVO {
	private int memberNo;
	private String name;
	private String identifyNo;
	private String gender;
	private String address;
	private String email;
	private String phone;
	private String pastHx;
	private String preSelfAx;
	private String topic;
	private String medDelivery;
	
	// 닥터 진료내역 페이지 진료노트_J10
	private String addr1;
	private String addr2;
	private String addr3;
	private int bookingNo;
	private Date consultDate;
	private String consultTime;
	private String ptAssessment;
	private String ptDiagnosis;
	private String subject;	// 진료과목 추가_J12
	private String ptSymptom;	// 증상 추가_J12
	
}
