package com.mima.app.doc.service;

import com.mima.app.doc.domain.DocAvailabilityVO;

public interface DocAvailabilityService {
	
	// 의사 진료 시간 조회 p.10/04
	public String selectDocTime(String day, int docNo);
	
	//S: 1005 의사 진료 가능 시간 요일 입력 
	public int insert(DocAvailabilityVO vo);
	
}
