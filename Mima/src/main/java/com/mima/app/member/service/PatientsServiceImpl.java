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

	@Override
	public List<PatientsVO> getList() {
		return patientsMapper.getList();
	}

	@Override
	public PatientsVO read(PatientsVO vo) {
		return patientsMapper.read(vo);
	}

	@Override
	public int insert(PatientsVO vo) {
		return patientsMapper.insert(vo);
	}

	@Override
	public int update(PatientsVO vo) {
		return patientsMapper.update(vo);
	}

	@Override
	public int delete(PatientsVO vo) {
		return patientsMapper.delete(vo);
	}

	
}
