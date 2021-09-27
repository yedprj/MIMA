package com.mima.app.medication.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PillSearchVO {

	private int resultCode;			// 결과코드
	private String resultMsg;		// 결과메세지
	private int numOfRows;			// 한 페이지 결과 수
	private int pageNo;				// 페이지 번호
	private int totalCount;			// 전체 결과 수
	private String entpName;		// 업체명
	private String itemName;		// 제품명
	private int itemSeq;			// 품목 기준 코드
	private String efcyQesitm;		// 약 효능
	private String useMethodQesitm; // 약 사용법
	private String atpnWarnQesit;	// 약 사용전 주의사항
	private String atpnQesitm;		// 약 사용상 주의사항
	private String intrcQesitm;		// 약 사용상 주의할 약 또는 음식
	private String seQesitm;		// 약 부작용
	private String depositMethodQesitm;  // 약 보관법
	private Date openDe;			// 공개일자
	private Date updateDe;			// 수정일자
	private String itemlmage;		// 낱알 이미지
	
	
}
