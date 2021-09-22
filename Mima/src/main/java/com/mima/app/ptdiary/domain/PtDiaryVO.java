package com.mima.app.ptdiary.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PtDiaryVO {
	// 테이블 수정 필요
	private int ptNo;
	private String emoStatus;
	private String syptom;
	private Date diaryDate;
	private String totalScore;
}
