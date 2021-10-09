package com.mima.app.pharmacy.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MedDeliveryVO {
	private int medDeliveryNo;		// 배달번호
	private int pharmacyNo;			// 약국번호
	private int bookingNo;			// 예약 번호
	private String deliveryDecline;	// 약 배달 가능 유무
	private String deliveryStatus;	// 약 배달 완료 유무
	private String ptEducation;		// 복약지도
	private String ptDeliveryArea;  // 약배달 주소
	private String ptDeliveryArea2;  // 주소2
	private String ptDeliveryArea3;  // 주소3
	private String ptNote;			// 약배달 신청시 특이사항
	private Date regdate;			// 약배달 신청날짜
	private String ptPostcode;		// 우편번호
	
}
