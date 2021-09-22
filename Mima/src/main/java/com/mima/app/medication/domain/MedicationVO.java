package com.mima.app.medication.domain;

import lombok.Data;

@Data
public class MedicationVO {
	// 약 정보는 api에 따라 수정 요망
	private int medNo;			// 약 번호
	private String medName;		// 약 이름
	private String medCategory;	// 약 카테고리
}
