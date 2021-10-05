package com.mima.app.doc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mima.app.doc.domain.DocAvailabilityVO;
import com.mima.app.doc.mapper.DocAvailabilityMapper;

@Service
public class DocAvailabilityServiceImpl implements DocAvailabilityService {

	@Autowired DocAvailabilityMapper docAvailabilityMapper;
	
	@Override
	public String selectDocTime(String day, int docNo) {
		return docAvailabilityMapper.selectDocTime(day, docNo);
	}

	//S: 1005 의사 진료 가능 시간 요일 입력 
	@Override
	public int insert(DocAvailabilityVO vo) {
		return docAvailabilityMapper.insert(vo);
	}

}
