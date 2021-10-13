package com.mima.app.pharmacy.mapper;

import java.util.List;

import com.mima.app.pharmacy.domain.MedDeliveryVO;
import com.mima.app.pharmacy.domain.MemDeliveryVO;

public interface MedDeliveryMapper {
	
	// K.10/13 약배달 조회
	public List<MemDeliveryVO> memDelivery(int pharmacyNo);
	
	// K.10/09 약배달 신청 한건 조회
	public MedDeliveryVO selectOne(int bookingNo);
}
