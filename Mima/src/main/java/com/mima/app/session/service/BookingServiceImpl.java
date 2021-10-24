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
	
	// 닥터 대쉬보드 메인 페이지 오늘의 예약 카운트_J07
	@Override
	public int countGetList(int memberNo) {
		return bookingMapper.countGetList(memberNo);
	}

	// 닥터 대쉬보드 메인 페이지 나의 환자들 카운트_J07
	@Override
	public int countPatientList(int memberNo) {
		return bookingMapper.countPatientList(memberNo);
	}
	
	// 닥터 대쉬보드 메인 페이지 오늘의 예약_J
	@Override
	public List<BookingVO> getList(int memberNo) {
		return bookingMapper.getList(memberNo);
	}
	
	// 닥터 대쉬보드 메인 페이지 진료내역_J
	@Override
	public List<BookingVO> getlatestapptList(int memberNo) {
		return bookingMapper.getlatestapptList(memberNo);
	}

	// 닥터 대쉬보드 예약관리 페이지_J
	@Override
	public List<BookingVO> apptList(int memberNo) {
		return bookingMapper.apptList(memberNo);
	}
	
	// 닥터 대쉬보드 예약관리 페이지 셀렉트 박스 예정된 목록_J11
	@Override
	public List<BookingVO> apptListSoon(int memberNo) {
		return bookingMapper.apptListSoon(memberNo);
	}

	// 닥터 대쉬보드 예약관리 페이지 셀렉트 박스 취소된 목록_J11
	@Override
	public List<BookingVO> apptListCanceled(int memberNo) {
		return bookingMapper.apptListCanceled(memberNo);
	}

	// 닥터 대쉬보드 예약관리 모두보기 페이징_J15
	@Override
	public List<BookingVO> apptListPage(Criteria cri, int memberNo) {
		return bookingMapper.apptListPage(cri, memberNo);
	}

	// 닥터 대쉬보드 예약관리 예정된 목록 페이징_J15
	@Override
	public List<BookingVO> apptListSoonPage(Criteria cri, int memberNo) {
		return bookingMapper.apptListSoonPage(cri, memberNo);
	}

	// 닥터 대쉬보드 예약관리 최소된 목록 페이징_J15
	@Override
	public List<BookingVO> apptListCanceledPage(Criteria cri, int memberNo) {
		return bookingMapper.apptListCanceledPage(cri, memberNo);
	}

	// 닥터 대쉬보드 예약관리 페이징 카운트_J15
	@Override
	public int apptManageCount(Criteria cri, int memberNo) {
		return bookingMapper.apptManageCount(cri, memberNo);
	}
	
	@Override
	public List<BookingVO> apptHistoryList(int memberNo) {
		return bookingMapper.apptHistoryList(memberNo);
	}
	// 닥터 대쉬보드 진료내역 페이징_J06
	@Override
	public List<BookingVO> apptHistoryPage(Criteria cri, int memberNo) {
		return bookingMapper.apptHistoryPage(cri, memberNo);
	}

	// 닥터 대쉬보드 진료내역 페이징 카운트_J06
	@Override
	public int apptHistoryCount(Criteria cri, int memberNo) {
		return bookingMapper.apptHistoryCount(cri, memberNo);
	}
	
	//	s:0929  s:1011 get rm Id
	@Override
	public BookingVO getRoomId(int bookingNo) {
		return bookingMapper.getRoomId(bookingNo);
	}

	//s:1003 예약정보 가져오기(노드에서 요청)
	@Override
	public BookingVO getBookingInfo(BookingVO vo) {
		return bookingMapper.getBookingInfo(vo);
	}

	// p.10/06 진료 예약 
	@Override
	public int insertBookingDate(BookingVO vo) {
		return bookingMapper.insertBookingDate(vo);
	}

	// p.10/07 결제 정보
	@Override
	public BookingVO selectBookingInfo(int memberNo) {
		return bookingMapper.selectBookingInfo(memberNo);
	}

	// Booking table 결제 status 업데이트 p.10/09
	@Override
	public int updateBookingStatus(BookingVO vo) {
		return bookingMapper.updateBookingStatus(vo);
	}

	// K.10/21 예약환자, 의사이름 찾기
	@Override
	public BookingVO findNamePtDoc(int bookingNo) {
		return bookingMapper.findNamePtDoc(bookingNo);
	}

	// p.10/24 진료 예약 취소 시 BOOKING테이블 status 변경
	@Override
	public int cancelUpdate(int bookingNo) {
		return bookingMapper.cancelUpdate(bookingNo);
	}

}
