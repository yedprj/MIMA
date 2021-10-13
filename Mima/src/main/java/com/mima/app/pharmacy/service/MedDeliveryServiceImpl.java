package com.mima.app.pharmacy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mima.app.pharmacy.domain.MedDeliveryVO;
import com.mima.app.pharmacy.domain.MemDeliveryVO;
import com.mima.app.pharmacy.mapper.MedDeliveryMapper;

@Service
public class MedDeliveryServiceImpl implements MedDeliveryService {

	@Autowired  MedDeliveryMapper deliveryMapper;
	
	// 한건조회?
	@Override
	public MedDeliveryVO selectOne(int bookingNo) {
		return deliveryMapper.selectOne(bookingNo);
	}


	// K.10/13 약배달 조회
	@Override
	public List<MemDeliveryVO> memDelivery(int pharmacyNo) {
		return deliveryMapper.memDelivery(pharmacyNo);
	}

	// K.10/13 약배달 상태 변경
	@Override
	public int deliveryStatusUpdate(MedDeliveryVO vo) {
		return deliveryMapper.deliveryStatusUpdate(vo);
	}

}
