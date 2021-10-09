package com.mima.app.pharmacy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mima.app.pharmacy.domain.MedDeliveryVO;
import com.mima.app.pharmacy.mapper.MedDeliveryMapper;

@Service
public class MedDeliveryServiceImpl implements MedDeliveryService {

	@Autowired  MedDeliveryMapper deliveryMapper;
	
	@Override
	public int deliveryInsert(MedDeliveryVO vo) {
		// TODO Auto-generated method stub
		return deliveryMapper.deliveryInsert(vo);
	}

	@Override
	public MedDeliveryVO selectOne(int bookingNo) {
		// TODO Auto-generated method stub
		return deliveryMapper.selectOne(bookingNo);
	}

}
