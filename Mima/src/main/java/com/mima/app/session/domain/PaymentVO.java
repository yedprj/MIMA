package com.mima.app.session.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PaymentVO {
	private String payMethod;	// 결제 수단
	private Date payDate;		// 결제 일
	private String payStatus;	// 결제 상태
	private String payResult;	// 결제 완료 후 결과 값
	private int payItem;		// 예약 번호
}
