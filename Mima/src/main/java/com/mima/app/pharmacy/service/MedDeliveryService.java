package com.mima.app.pharmacy.service;

import java.util.List;

import com.mima.app.pharmacy.domain.MedDeliveryVO;
import com.mima.app.pharmacy.domain.MemDeliveryVO;

public interface MedDeliveryService {

	// K.10/13 약배달 조회
	public List<MemDeliveryVO> memDelivery(int pharmacyNo);
	
	// K.10/09 약배달 신청 한건 조회
	public MedDeliveryVO selectOne(int bookingNo);
	
	// K.10/13 약배달 상태 변경
	public int deliveryStatusUpdate(MedDeliveryVO vo);
	
	// k. 10/14 약배달 취소
	public int delCancel(MedDeliveryVO vo);
	
	// K.10/14 약배달 목록 조회
	public List<MedDeliveryVO> phaSelectOne(int pharmacyNo);
}
