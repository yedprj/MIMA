package com.mima.app.member.service;

import java.util.List;

import com.mima.app.member.domain.PatientsVO;

public interface PatientsService {
	
	public List<PatientsVO> getList();
	
	public PatientsVO read(PatientsVO vo);
	
	public int insert(PatientsVO vo);
	
	public int update(PatientsVO vo);
	
	public int delete(PatientsVO vo);
}
