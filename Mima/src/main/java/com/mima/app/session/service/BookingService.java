package com.mima.app.session.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mima.app.criteria.domain.Criteria;
import com.mima.app.session.domain.BookingVO;

public interface BookingService {

	// 닥터 대쉬보드 메인 페이지 오늘의 예약 카운트_J07
	public int countGetList(int memberNo);
	
	// 닥터 대쉬보드 메인 페이지 나의 환자들 카운트_J07
	public int countPatientList(int memberNo);

	// 닥터 대쉬보드 메인 페이지 오늘의 예약_J
	public List<BookingVO> getList(int memberNo);
		
	// 닥터 대쉬보드 메인 페이지 진료내역_J
	public List<BookingVO> getlatestapptList(int memberNo);
	
	// 닥터 대쉬보드 예약관리 페이지_J
	public List<BookingVO> apptList(int memberNo);
	
	// 닥터 대쉬보드 예약관리 페이지 셀렉트 박스 예정된 목록_J11
	public List<BookingVO> apptListSoon(int memberNo);
	
	// 닥터 대쉬보드 예약관리 페이지 셀렉트 박스 취소된 목록_J11
	public List<BookingVO> apptListCanceled(int memberNo);
	
	// 닥터 대쉬보드 예약관리 페이지 모두보기 페이징_J15
	public List<BookingVO> apptListPage(@Param("cri") Criteria cri, @Param("memberNo") int memberNo);
	
	// 닥터 대쉬보드 나의 후기 페이지 예정된 목록 페이징_J15
	public List<BookingVO> apptListSoonPage(@Param("cri") Criteria cri, @Param("memberNo") int memberNo);
	
	// 닥터 대쉬보드 나의 후기 페이지 취소된 목록 페이징_J15
	public List<BookingVO> apptListCanceledPage(@Param("cri") Criteria cri, @Param("memberNo") int memberNo);
	
	// 닥터 대쉬보드 예약관리 페이징 데이터 수 전체조회_J15
	public int apptManageCount(Criteria cri, int memberNo);
	
	// 닥터 대쉬보드 진료내역 페이지_J29
	public List<BookingVO> apptHistoryList(int memberNo);
	
	// 닥터 대쉬보드 진료내역 페이징_J06
	public List<BookingVO> apptHistoryPage(Criteria cri, int memberNo);
	
	// 닥터 대쉬보드 진료내역 페이징 데이터 수 전체조회_J06
	public int apptHistoryCount(Criteria cri, int memberNo);
	
	
	
	
	//s:0929 s:1011 수정 예약번호 받아서 방 아이디 가져오기
	public BookingVO getRoomId(int bookingNo);

	//s:1003 단일 예약정보 가져오기
	public BookingVO getBookingInfo(BookingVO vo);
	
	//p.10/06 진료 예약
	public int insertBookingDate(BookingVO vo);
	
	//p.10.07 결제 정보
	public BookingVO selectBookingInfo(int memberNo);
	
	// Booking table 결제 status 업데이트 p.10/09
	public int updateBookingStatus(BookingVO vo);
}
