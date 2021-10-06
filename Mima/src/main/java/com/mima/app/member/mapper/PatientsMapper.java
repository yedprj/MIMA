package com.mima.app.member.mapper;

import java.util.List;

import com.mima.app.admin.domain.CscVO;
import com.mima.app.admin.domain.QnaVO;
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
	//전체조회 페이징
	public List<PatientsVO> getPatientsList(Criteria cri);

	//e.4
	//전체 데이터 수 조회 페이징
	public int getTotalPatientsCount(Criteria cri);
	
	//e.4
	//환자대쉬보드 Main 오늘의예약
	public List<BookingVO> ptgetList(int memberNo);

	//환자대쉬보드 예약관리 페이지 e.5
	public List<BookingVO> ptbmList(int memberNo);
	
	//전체조회 예약관리 페이징 e.5
	public List<BookingVO> getPtbmList(Criteria cri);
	
	//전체 데이터 수 조회 예약관리 페이징 e.5
	public int getTotalPtbmCount(Criteria cri);
	
	//환자대쉬보드 Main 진료내역 e.5
	public List<BookingVO> ptMainhisList(int memberNo);
	
	//환자대쉬보드 진료내역 페이지 e.5
	public List<BookingVO> ptHistoryList(int memberNo);
	
	//전체조회 진료내역 페이징 e.6
	public List<BookingVO> getPthList(Criteria cri);
	
	//전체 데이터 수 조회 진료내역 페이징 e.6
	public int getTotalPthCount(Criteria cri);
	
	//환자대쉬보드 Main 나의후기 e.5
	public List<CommentsVO> ptMainreList(int memberNo);

	//환자대쉬보드 나의후기 페이지 e.5
	public List<CommentsVO> ptReviewList(int memberNo);
	
	//전체조회 나의후기 페이징 e.6
	public List<CommentsVO> getPtrvList(Criteria cri);
	
	//전체 데이터 수 조회 나의후기 페이징 e.6
	public int getTotalPtrvCount(Criteria cri);
	
	//환자대쉬보드 나의문의 페이지 e.6
	public List<QnaVO> ptQna(int memberNo);
}
