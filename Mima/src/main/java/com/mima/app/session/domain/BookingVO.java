package com.mima.app.session.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BookingVO {
	private int bookingNo;		// 예약번호
	private int ptNo;			// 환자번호
	private int docNo;			// 의사번호
	private Date bookingDate;	// 예약일
	private int price;			// 금액
	private String payStatus;	// 결제 유무
	private String bookingStatus;	// 에약 상태
	private Date consultDate;	// 실제 진료 일
	private String consultTime;	// 실제 진료 시간
	private Date editDate;		// 예약 수정 날짜
}
