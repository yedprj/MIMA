package com.mima.app.member.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class PtDeliveryVO {
	
	private int bookingNo;			// 예약번호
	@DateTimeFormat(pattern = "yyyy/MM/dd")	
	private Date consultDate;		// 진료일자
	private String subject;			// 진료과목
	private String docName;			// 진료의사
	private String pharmacyName;		// 신청약국이름
	private String deliveryStatus;	// 약배달신청상태

}
