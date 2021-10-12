package com.mima.app.session.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mima.app.session.domain.BookingVO;
import com.mima.app.session.domain.ConsultationVO;
import com.mima.app.session.domain.PtInfoVO;
import com.mima.app.session.mapper.ConsultationMapper;

@Service
public class ConsultationServiceImpl implements ConsultationService {

	@Autowired ConsultationMapper consultationMapper;
	
	@Override
	public PtInfoVO getPtInformation(BookingVO vo) {
		return consultationMapper.getPtInformation(vo);
	}
	
	//s:1012 진료테이블 검색해서 값이 있는지 없는지 확인
	@Override
	public ConsultationVO checkTable(ConsultationVO vo) {
		return consultationMapper.checkTable(vo);
	}
	
	//s:1012 노드에서 호출, 진료기록 인서트
	@Override
	public int consultInsert(ConsultationVO vo) {
		return consultationMapper.consultInsert(vo);
	}
	
	//s:1012 노드에서 호출, 처방전 인서트
	@Override
	public int medInsert(ConsultationVO vo) {
		return consultationMapper.medInsert(vo);
	}

}
