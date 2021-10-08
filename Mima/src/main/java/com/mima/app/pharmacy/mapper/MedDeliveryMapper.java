package com.mima.app.pharmacy.mapper;

import com.mima.app.pharmacy.domain.MedDeliveryVO;

public interface MedDeliveryMapper {
	
	// K.10/08 약배달 신청
	public int deliveryInsert(MedDeliveryVO vo);

}
