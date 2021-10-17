package com.mima.app.doc.service;

import com.mima.app.doc.domain.MentalSubjectVO;

public interface MentalSubjectService {
	//S: 1005 의사 진료 과목과 가격 입력 
		public int insert(MentalSubjectVO vo);

	//S: 1017 의사 진료 과목과 가격 update 
	public int update(MentalSubjectVO vo);
	
	// p.10/07 의사 카테고리 금액 가져오기
	public MentalSubjectVO getPriceCategory(int docNo);
	
	// p.10/07 의사 카테고리만 가져오기
	public MentalSubjectVO categorySelect(int docNo);
	
	
}