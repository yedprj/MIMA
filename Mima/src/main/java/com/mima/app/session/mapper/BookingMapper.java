package com.mima.app.session.mapper;

import java.util.List;

import com.mima.app.session.domain.BookingVO;

public interface BookingMapper {

	// 닥터 대쉬보드 메인 페이지 오늘의 예약_J
	public List<BookingVO> getList();
	
	// 닥터 대쉬보드 메인 페이지 진료내역_J
	public List<BookingVO> getlatestapptList();
	
	// 닥터 대쉬보드 예약관리 페이지_J
	public List<BookingVO> apptList();
	
	// 닥터 대쉬보드 진료내역 페이지_J29
	public List<BookingVO> apptHistoryList();
	
}
