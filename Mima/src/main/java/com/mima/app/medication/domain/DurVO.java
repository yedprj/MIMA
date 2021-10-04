package com.mima.app.medication.domain;

import lombok.Data;

@Data
public class DurVO {

	// 요청 변수
	private String entpName;		// Drug 유형
	private String itemName;		// 품목명

	private int resultCode;			// 결과코드
	private String resultMsg;		// 결과메세지
	private int numOfRows;			// 한 페이지 결과 수
	private int pageNo;				// 페이지 번호
	private int totalCount;			// 전체 결과 수

	private String itemSeq;			// 품목기준코드
	private String itemPermitDate;		// 품목허가일자
	private String etcOtcCode;		// 전문일반 구분코드
	private String classNo;			// 분류
	private String chart;			// 성상
	private String barCode;			// 표준코드
	private String materialName;	// 원료성분
	private String eeDocId;			// 제조방법
	private String udDocId;			// 용법용량
	private String nbDocId;			// 주의사항
	private String insertFile;		// 첨부문서
	private String storageMethod;	// 저장방법
	private String validTerm;		// 유효기간
	private String reexamTarger;	// 재심사대상
	private String reexamDate;		// 재심사기간
	private String packUnit;		// 포장단위
	private String ediCode;			// 보험코드
	private String cancelDate;		// 취소일자
	private String cancelName;		// 상태
	private String changeDate;		// 변경일자
	
	

}
