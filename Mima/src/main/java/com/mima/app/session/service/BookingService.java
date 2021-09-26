package com.mima.app.session.service;

import java.util.List;

import com.mima.app.session.domain.BookingVO;

public interface BookingService {

	public List<BookingVO> getList();
	public List<BookingVO> getlatestapptList();

}
