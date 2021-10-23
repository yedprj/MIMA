package com.mima.app.pharmacy.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class MedDeliveryVO {
	private int medDeliveryNo;		// 배달번호
	private int pharmacyNo;			// 약국번호
	private int bookingNo;			// 예약 번호
	private String deliveryDecline;	// 약 배달 취소 이유
	private String deliveryStatus;	// 약 배달 완료 유무
	private String ptEducation;		// 복약지도
	private String name;			// 환자이름
	@JsonFormat(pattern = "YY/MM/dd")
	private Date consultDate;		// 약배달 날짜
	private String pharmacyName;	// 약국 이름
	
}
