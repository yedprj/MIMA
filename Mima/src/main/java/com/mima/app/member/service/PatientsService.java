package com.mima.app.member.service;

import java.util.List;

import com.mima.app.member.domain.PatientsVO;

public interface PatientsService {
	
	//e.29
	//관리자 회원정보조회
	public List<PatientsVO> getList();
	
	//s:1004 자가정보 입력
	public int update(PatientsVO vo);
	//s:1004 자가진단표
	public int updateAx(PatientsVO vo);

	
}
