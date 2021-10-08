package com.mima.app.member.service;

import java.util.List;

import com.mima.app.member.domain.ExperienceVO;

public interface ExperienceService {
	//s:1007 경력 테이블 인서트
	public int insertExp(ExperienceVO vo);
	
	//s:1008 경력 테이블 한 의사의 여러 경력 가져오기
	public List<ExperienceVO> getExpList(ExperienceVO vo);
	
	//s:1008 한 의사의 경력 수정하기 (경력번호를 넣어줘야함)
	public int updateExp(ExperienceVO vo);
	
	//s:1008 경력 테이블 한 의사의 경력 삭제하기(경력번호를 넣어줘야함)
	public int deleteExp(ExperienceVO vo);
}
