package com.mima.app.session.mapper;

import com.mima.app.session.domain.PaymentVO;

public interface PaymentMapper {
	
	// PAYMENT 테이블에 결제 결과 전달 p.10/09
	public int insertPayment(PaymentVO vo); 
}
