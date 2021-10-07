package com.mima.app.session.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class BookingVO {
	private int bookingNo;		// 예약번호
	private String name;		// 환자명
	private int ptNo;			// 환자번호
	private int docNo;			// 의사번호
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date bookingDate;	// 예약일
	private int price;			// 금액
	private String payStatus;	// 결제 유무
	private String bookingStatus;	// 예약 상태
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date consultDate;	// 진료일
	private String consultTime;	// 진료시간
	private Date editDate;		// 예약 수정 날짜
	
	private String roomId; 		// 진료 링크주소 s:0929
	private String docName;		//의사이름
	
	private String firstSession;	// 첫 진료 여부
	private String subject;			// 진료 과목
	
}
