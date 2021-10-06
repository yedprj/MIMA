package com.mima.app.session.service;

import java.util.List;

import com.mima.app.criteria.domain.Criteria;
import com.mima.app.session.domain.BookingVO;

public interface BookingService {

	// 닥터 대쉬보드 메인 페이지 오늘의 예약_J
	public List<BookingVO> getList();
		
	// 닥터 대쉬보드 메인 페이지 진료내역_J
	public List<BookingVO> getlatestapptList();
	
	// 닥터 대쉬보드 예약관리 페이지_J
	public List<BookingVO> apptList();
	
	// 닥터 대쉬보드 진료내역 페이지_J29
	public List<BookingVO> apptHistoryList();
	
	// 닥터 대쉬보드 예약관리 페이징_J06
	public List<BookingVO> apptListPage(Criteria cri);
	
	// 닥터 대쉬보드 예약관리 페이징 데이터 수 전체조회_J06
	public int apptListCount(Criteria cri);
	
	// 닥터 대쉬보드 진료내역 페이징_J06
	public List<BookingVO> apptHistoryPage(Criteria cri);
	
	// 닥터 대쉬보드 진료내역 페이징 데이터 수 전체조회_J06
	public int apptHistoryCount(Criteria cri);
	
	
	
	//s:0929 진료시간 5분 전 부터 매 10초마다 테이블 확인해서 방 아이디 확인
	public List<BookingVO> getRoomId();

	//s:1003 단일 예약정보 가져오기
	public BookingVO getBookingInfo(BookingVO vo);
	
	//p.10/06 진료 예약
	public int insertBookingDate(BookingVO vo);
	
}
