package com.mima.app.doc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mima.app.doc.domain.MentalSubjectVO;
import com.mima.app.doc.mapper.MentalSubjectMapper;

@Service
public class MentalSubjectServiceImpl implements MentalSubjectService {

	@Autowired MentalSubjectMapper mentalSubjectMapper;
	
	
	//S: 1005 의사 진료 과목과 가격 입력
	@Override
	public int insert(MentalSubjectVO vo) {
		return mentalSubjectMapper.insert(vo);
	}

}
