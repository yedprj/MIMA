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
	public List<BookingVO> getList(BookingVO vo) {
		return bookingMapper.getList();
	}

}
