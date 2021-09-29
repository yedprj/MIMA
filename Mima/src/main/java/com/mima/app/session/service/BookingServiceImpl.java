package com.mima.app.session.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mima.app.session.domain.BookingVO;
import com.mima.app.session.mapper.BookingMapper;

@Service
public class BookingServiceImpl implements BookingService {

	@Autowired BookingMapper bookingMapper;
	
	// 닥터 대쉬보드 메인 페이지 오늘의 예약_J
	@Override
	public List<BookingVO> getList() {
		return bookingMapper.getList();
	}
	
	// 닥터 대쉬보드 메인 페이지 진료내역_J
	@Override
	public List<BookingVO> getlatestapptList() {
		return bookingMapper.getlatestapptList();
	}

	// 닥터 대쉬보드 예약관리 페이지_J
	@Override
	public List<BookingVO> apptList() {
		return bookingMapper.apptList();
	}

	@Override
	public List<BookingVO> apptHistoryList() {
		return bookingMapper.apptHistoryList();
	}

}
