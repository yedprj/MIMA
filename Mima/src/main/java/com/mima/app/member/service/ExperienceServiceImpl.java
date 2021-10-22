package com.mima.app.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mima.app.member.domain.ExperienceVO;
import com.mima.app.member.domain.MemberVO;
import com.mima.app.member.mapper.ExperienceMapper;

@Service
public class ExperienceServiceImpl implements ExperienceService {

	@Autowired ExperienceMapper experienceMapper;
	
	//s:1007 경력테이블 인서트
	@Override
	public int insertExp(ExperienceVO vo) {
		return experienceMapper.insertExp(vo);
	}

	//s:1008 경력 테이블 한 의사의 여러 경력 가져오기
	@Override
	public List<ExperienceVO> getExpList(ExperienceVO vo) {
		return experienceMapper.getExpList(vo);
	}

	//s:1008 한 의사의 경력 수정하기 (경력번호를 넣어줘야함)
	@Override
	public int updateExp(ExperienceVO vo) {
		return experienceMapper.updateExp(vo);
	}

	//s:1008 경력 테이블 한 의사의 경력 삭제하기(경력번호를 넣어줘야함)
	@Override
	public int deleteExp(ExperienceVO vo) {
		return experienceMapper.deleteExp(vo);
	}
	
	//s:1020 의사 프로필 경력 입력
	@Override
	public int insertExpAjax(ExperienceVO vo) {
		
		return experienceMapper.insertExpAjax(vo);
	}

	//s:1020 의사 프로필 경력 수정
	@Override
	public int updateExpAjax(ExperienceVO vo) {
		return experienceMapper.updateExpAjax(vo);
	}
	
}
