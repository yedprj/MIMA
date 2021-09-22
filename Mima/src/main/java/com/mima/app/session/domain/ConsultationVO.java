package com.mima.app.session.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ConsultationVO {
	private Date consultDate;		// 예약 번호
	private String ptAssessment;	// 환자 진료 기록
	private String ptDiagnosis;		// 환자 진단
	private String voiceRecord;		// 음성 진료 기록
	private int bookingNo;			// 예약 번호
	private String prescription;	// 처방전
	private int ptNo;				// 환자번호
	private int docNo;				// 의사번호
}
