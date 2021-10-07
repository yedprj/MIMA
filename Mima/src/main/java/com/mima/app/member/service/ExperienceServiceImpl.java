package com.mima.app.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mima.app.member.domain.ExperienceVO;
import com.mima.app.member.mapper.ExperienceMapper;

@Service
public class ExperienceServiceImpl implements ExperienceService {

	@Autowired ExperienceMapper experienceMapper;
	
	//s:1007 경력테이블 인서트
	@Override
	public int insertExp(ExperienceVO vo) {
		return experienceMapper.insertExp(vo);
	}

}
