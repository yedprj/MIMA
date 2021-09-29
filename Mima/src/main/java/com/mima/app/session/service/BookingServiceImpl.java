package com.mima.app.session.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mima.app.session.domain.BookingVO;
import com.mima.app.session.mapper.BookingMapper;

@Service
public class BookingServiceImpl implements BookingService {

	@Autowired BookingMapper bookingMapper;
	
	@Override
	public List<BookingVO> getList() {
		return bookingMapper.getList();
	}

	@Override
	public List<BookingVO> getlatestapptList() {
		return bookingMapper.getlatestapptList();
	}

	@Override
	public List<BookingVO> apptList() {
		return bookingMapper.apptList();
	}

//	s:0929 진료시간 5분전 매10초마다 테이블확인 to get rm Id
	@Override
	public List<BookingVO> getRoomId() {
		return bookingMapper.getRoomId();
	}

}
