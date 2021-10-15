package com.mima.app.session.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mima.app.comments.domain.CommentsVO;
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
	
	//s:1012 노드에서 호출, 처방전 인서트 진단테이블
	@Override
	public int medInsert(ConsultationVO vo) {
		return consultationMapper.medInsert(vo);
	}

	//s:1015
	@Override
	public String checkPtId(int memberNo) {
		return consultationMapper.checkPtId(memberNo);
	}
	
	//s:1014 노드에서 호출 처방전 인서트 약배달 테이블
	@Override
	public int medDeliveryInsert(ConsultationVO vo) {
		return consultationMapper.medDeliveryInsert(vo);
	}

	@Override
	public PtInfoVO getSessionInfo(BookingVO vo) {
		return consultationMapper.getSessionInfo(vo);
	}

	@Override
	public int ptReviewInsert(CommentsVO vo) {
		return consultationMapper.ptReviewInsert(vo);
	}

	@Override
	public CommentsVO checkRv(CommentsVO vo) {
		return consultationMapper.checkRv(vo);
	}

}
