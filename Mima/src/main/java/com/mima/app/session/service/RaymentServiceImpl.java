package com.mima.app.session.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mima.app.session.domain.PaymentVO;
import com.mima.app.session.mapper.PaymentMapper;

@Service
public class RaymentServiceImpl implements RaymentService {
	
	@Autowired PaymentMapper paymentMapper;
	
	@Override
	public int insertPayment(PaymentVO vo) {
		return paymentMapper.insertPayment(vo);
	}
	
	// 결제 취소에 따른 pay_status 변경 p.10/24
	@Override
	public int payStatusUpdate(PaymentVO vo) {
		return paymentMapper.payStatusUpdate(vo);
	}

}
