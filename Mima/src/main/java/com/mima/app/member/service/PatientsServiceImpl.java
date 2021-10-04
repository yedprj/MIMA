package com.mima.app.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mima.app.member.domain.PatientsVO;
import com.mima.app.member.mapper.PatientsMapper;


@Service
public class PatientsServiceImpl implements PatientsService {
	
	@Autowired
	PatientsMapper patientsMapper;

	//e.29
	//관리자 회원정보조회
	@Override
	public List<PatientsVO> getList() {
		return patientsMapper.getList();
	}
	//s:1004 self assessment extra info
	@Override
	public int update(PatientsVO vo) {
		return patientsMapper.update(vo);
	}
	//s:1004 self assessment result
	@Override
	public int updateAx(PatientsVO vo) {
		return patientsMapper.updateAx(vo);
	}
	
	
}
