package com.mima.app.session.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mima.app.session.domain.BookingVO;
import com.mima.app.session.domain.PtInfoVO;
import com.mima.app.session.mapper.ConsultationMapper;

@Service
public class ConsultationServiceImpl implements ConsultationService {

	@Autowired ConsultationMapper consultationMapper;
	
	@Override
	public PtInfoVO getPtInformation(BookingVO vo) {
		return consultationMapper.getPtInformation(vo);
	}

}
