package com.mima.app.doc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mima.app.doc.mapper.DocAvailabilityMapper;

@Service
public class DocAvailabilityServiceImpl implements DocAvailabilityService {

	@Autowired DocAvailabilityMapper docAvailabilityMapper;
	
	@Override
	public String selectDocTime(String day, int docNo) {
		return docAvailabilityMapper.selectDocTime(day, docNo);
	}

}
