package com.mima.app.pharmacy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mima.app.criteria.domain.Criteria;
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

	// K.10/14 약배달 취소
	@Override
	public int delCancel(MedDeliveryVO vo) {
		return deliveryMapper.delCancel(vo);
	}

	// K.10/14 약국별 약배달 현황
	@Override
	public List<MedDeliveryVO> phaSelectOne(int pharmacyNo) {
		return deliveryMapper.phaSelectOne(pharmacyNo);
	}

	// K.10/14 오늘의 약배달 수
	@Override
	public int deliveryCnt(int pharmacyNo) {
		return deliveryMapper.deliveryCnt(pharmacyNo);
	}

	// K.10/14 오늘의 약배달 신청건수 조회
	@Override
	public List<MemDeliveryVO> todayDelivery(int pharmacyNo) {
		return deliveryMapper.todayDelivery(pharmacyNo);
	}

	// K.10/14 복약지도수 
	@Override
	public int ptEducationCnt(int pharmacyNo) {
		return deliveryMapper.ptEducationCnt(pharmacyNo);
	}

	// K. 10/14 복약지도 관리
	@Override
	public List<MemDeliveryVO> ptEducation(int pharmacyNo, Criteria cri) {
		return deliveryMapper.ptEducation(pharmacyNo, cri);
	}

	// K. 10/14 복약지도 완료처리
	@Override
	public int ptEduStatusUpdate(int bookingNo) {
		return deliveryMapper.ptEduStatusUpdate(bookingNo);
	}

}
