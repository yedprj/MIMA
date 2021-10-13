package com.mima.app.pharmacy.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class MemDeliveryVO {
	
	private int pharmacyNo;			// 약국 번호
	private String name;			// 환자이름
	private int bookingNo;			// 예약번호
	@JsonFormat(pattern = "YY/MM/dd")
	private Date consultDate;		// 진료일(처방전전송일)
	private String prescription;	// 처방전
	private String delAddr;			// 주소
	private String delAddr2;		// 도로명주소
	private String delAddr3;		// 상세주소
	private String delPostCode;		// 우편번호
	private String delNote;			// 배송메모
	

}
