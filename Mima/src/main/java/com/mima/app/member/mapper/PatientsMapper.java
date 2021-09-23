package com.mima.app.member.mapper;

import java.util.List;

import com.mima.app.member.domain.PatientsVO;

public interface PatientsMapper {
	
	public List<PatientsVO> getList();
	
	public PatientsVO read(PatientsVO vo);
	
	public int insert(PatientsVO vo);
	
	public int update(PatientsVO vo);
	
	public int delete(PatientsVO vo);
}
