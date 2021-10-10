package com.mima.app.session.service;

import com.mima.app.session.domain.PaymentVO;

public interface RaymentService {

	// PAYMENT 테이블에 결제 결과 전달 p.10/09
	public int insertPayment(PaymentVO vo); 
}
