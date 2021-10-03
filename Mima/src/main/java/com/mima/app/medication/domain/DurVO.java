package com.mima.app.medication.domain;

import lombok.Data;

@Data
public class DurVO {

	// 요청 변수
	private String typeName;		// Drug 유형
	private String ingrCode;		// Drug 성분코드
	private String itemName;		// 품목명

	private int resultCode;			// 결과코드
	private String resultMsg;		// 결과메세지
	private int numOfRows;			// 한 페이지 결과 수
	private int pageNo;				// 페이지 번호
	private int totalCount;			// 전체 결과 수

	private int DurSeq;				// 약 일련번호
	private int typeCode;			// 유형코드
	private String mix;				// 단일,복합
	private String ingKorName; 		// 약 성분
	private String ingrEngName;		// 약 성분(영문)
	private String mixIngr;			// 복합제
	private int itemSeq;			// 품목기준코드
	private String entpName;		// 업체명
	private String chart;			// 성상
	private String formCode;		// 제형구분코드
	private String etcOtcCode;		// 전문일반 구분코드
	private String classCode;		// 약효분류코드
	private String formName;		// 제형
	private String etcOtcName; 		// 전문/일반
	private String className;		// 약효분류
	private String mainIngr;		// 주성분
	private String mixTureDurSeq;	// 병용금기 약번호
	private String mixTureIngrKorName; 	// 병용금기 약 성분
	private String mixTureIngrEngName;  // 병용금기 약 성분(영문)
	private int mixTureItemSeq;			// 병용금기품목기준코드
	private String mixTureItemName;		// 병용금기품목명
	private String mixTureEntpName; 	// 병용금기 업체명
	private String mixTureFormCode;		//병용금기 제형구분코드
	private String mixTureEtcOtcCode;	// 병용금기 전문일반구분코드
	private String mixTureClassCode;	// 병용금기 약효분류 코드
	private String mixTureFormname;		// 병용금기 제형
	private String mixTureEtcOtcName;	// 병용금기 전문/일반
	private String mixTureClassName;	// 병용금기 약효분류
	private String mixTureMainIngr;		// 병용금기 주성분
	private String notificationDate;	// 고시일자
	private String prohbtContent;		// 금기내용
	private String remart;				// 비고
	private String itemPermitDate;		// 품목허가일자
	private String mixTureItemPermitDate; // 병용금기 품목 허가일자
	private String mixTureChart;		// 병용금기성상

}
