package com.mima.app.doc.service;


public interface DocAvailabilityService {
	
	// 의사 진료 시간 조회 p.10/04
	public String selectDocTime(String day, int docNo);
}
