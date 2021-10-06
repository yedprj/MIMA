package com.mima.app.session.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mima.app.criteria.domain.Criteria;
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

	// 닥터 대쉬보드 예약관리 페이징_J06
	@Override
	public List<BookingVO> apptListPage(Criteria cri) {
		return bookingMapper.apptListPage(cri);
	}
	
	// 닥터 대쉬보드 예약관리 페이징_J06
	@Override
	public int apptListCount(Criteria cri) {
		return bookingMapper.apptListCount(cri);
	}
	
	// 닥터 대쉬보드 진료내역 페이징_J06
	@Override
	public List<BookingVO> apptHistoryPage(Criteria cri) {
		return bookingMapper.apptHistoryPage(cri);
	}

	// 닥터 대쉬보드 진료내역 페이징_J06
	@Override
	public int apptHistoryCount(Criteria cri) {
		return bookingMapper.apptHistoryCount(cri);
	}
	
	
	
//	s:0929 진료시간 5분전 매10초마다 테이블확인 to get rm Id
	@Override
	public List<BookingVO> getRoomId() {
		return bookingMapper.getRoomId();
	}

//s:1003 예약정보 가져오기(노드에서 요청)
	@Override
	public BookingVO getBookingInfo(BookingVO vo) {
		return bookingMapper.getBookingInfo(vo);
	}



}
