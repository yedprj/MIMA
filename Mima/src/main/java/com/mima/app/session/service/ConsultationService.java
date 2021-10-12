package com.mima.app.session.service;

import com.mima.app.session.domain.BookingVO;
import com.mima.app.session.domain.ConsultationVO;
import com.mima.app.session.domain.PtInfoVO;

public interface ConsultationService {
	public PtInfoVO getPtInformation(BookingVO vo);
	
	//s:1012 진료테이블 검색해서 값이 있는지 없는지 확인
	public ConsultationVO checkTable(ConsultationVO vo);
	
	//s:1012 노드에서 호출, 진료기록 인서트
	public int consultInsert(ConsultationVO vo);
	
	//s:1012 노드에서 호출, 처방전 인서트
	public int medInsert(ConsultationVO vo);
	
	
}
