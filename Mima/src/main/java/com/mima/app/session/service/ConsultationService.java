package com.mima.app.session.service;

import com.mima.app.comments.domain.CommentsVO;
import com.mima.app.session.domain.BookingVO;
import com.mima.app.session.domain.ConsultationVO;
import com.mima.app.session.domain.PtInfoVO;

public interface ConsultationService {
	public PtInfoVO getPtInformation(BookingVO vo);
	
	//s:1014 노드에서 요청, 환자의 경우 진료+의사정보 조회
	public PtInfoVO getSessionInfo(BookingVO vo);
	
	//s:1012 진료테이블 검색해서 값이 있는지 없는지 확인
	public ConsultationVO checkTable(ConsultationVO vo);
	
	//s:1012 노드에서 호출, 진료기록 인서트
	public int consultInsert(ConsultationVO vo);
	
	//s:1012 노드에서 호출, 처방전 인서트-> 진단테이블
	public int medInsert(ConsultationVO vo);
	
	//s:1014 환자 아이디 구하기(푸시노티피케이션)
	public String checkPtId(int memberNo);
	
	//s:1012 노드에서 호출, 처방전 인서트-> 약배달
	public int medDeliveryInsert(ConsultationVO vo);
	
	//s:1015 리뷰등록 전 리뷰 유무 확인
	public CommentsVO checkRv(CommentsVO vo);
	//s:1015 환자가 의사 리뷰 등록
	public int ptReviewInsert(CommentsVO vo);
	
	//s:1025 노드에서 호출, 방번호 인서트
	public int rmNoInsert(BookingVO vo);
}
