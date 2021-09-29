package com.mima.app.session.service;

import java.util.List;

import com.mima.app.session.domain.BookingVO;

public interface BookingService {

	public List<BookingVO> getList();
	public List<BookingVO> getlatestapptList();
	public List<BookingVO> apptList();
	
	//s:0929 진료시간 5분 전 부터 매 10초마다 테이블 확인해서 방 아이디 확인
	public List<BookingVO> getRoomId();

}
