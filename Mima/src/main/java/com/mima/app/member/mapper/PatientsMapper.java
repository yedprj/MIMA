package com.mima.app.member.mapper;

import java.util.List;

import com.mima.app.comments.domain.CommentsVO;
import com.mima.app.criteria.domain.Criteria;
import com.mima.app.member.domain.PatientsVO;
import com.mima.app.session.domain.BookingVO;

public interface PatientsMapper {
	
	//e.29
	//관리자 회원정보조회
	public List<PatientsVO> getList();
	
	//s:1004 자가진단표+정보 입력
	public int update(PatientsVO vo);
	//s:1004 자가진단표
	public int updateAx(PatientsVO vo);

	//e.4
	//전체조회
	public List<PatientsVO> getPatientsList(Criteria cri);

	//e.4
	//전체 데이터 수 조회
	public int getTotalPatientsCount(Criteria cri);
	
	//e.4
	//환자대쉬보드 Main 오늘의예약
	public List<BookingVO> ptgetList();

	//환자대쉬보드 예약관리 페이지 e.5
	public List<BookingVO> ptbmList();
	
	//환자대쉬보드 Main 진료내역 e.5
	public List<BookingVO> ptMainhisList();
	
	//환자대쉬보드 진료내역 페이지 e.5
	public List<BookingVO> ptHistoryList();
	
	//환자대쉬보드 Main 나의후기 e.5
	public List<CommentsVO> ptMainreList();

	//환자대쉬보드 나의후기 페이지 e.5
	public List<CommentsVO> ptReviewList();
}
