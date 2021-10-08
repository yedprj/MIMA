package com.mima.app.pharmacy.service;

import com.mima.app.pharmacy.domain.MedDeliveryVO;

public interface MedDeliveryService {

	// K.10/08 약배달 신청
	public int deliveryInsert(MedDeliveryVO vo);
	
}
