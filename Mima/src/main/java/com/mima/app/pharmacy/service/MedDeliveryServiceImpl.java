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
	public List<MemDeliveryVO> memDelivery(int pharmacyNo, Criteria cri) {
		return deliveryMapper.memDelivery(pharmacyNo, cri);
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
	public List<MedDeliveryVO> phaSelectOne(int pharmacyNo, Criteria cri) {
		return deliveryMapper.phaSelectOne(pharmacyNo,cri);
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

	// K. 10/18 환자 약배달취소 내역 조회
	@Override
	public MedDeliveryVO delCancelReason(int bookingNo) {
		return deliveryMapper.delCancelReason(bookingNo);
	}

	// K.10/19 환자 약배달 수령 후 상태 변경
	@Override
	public int delcompleteUpdate(MedDeliveryVO vo) {
		return deliveryMapper.delcompleteUpdate(vo);
	}

	// K. 10/19 환자 약배달 재신청
	@Override
	public int delReapply(MedDeliveryVO vo) {
		return deliveryMapper.delReapply(vo);
	}

	// K. 10/19 약국 배달완료 목록 조회
	@Override
	public List<MemDeliveryVO> phaCompleteDel(int pharmacyNo, Criteria cri) {
		return deliveryMapper.phaCompleteDel(pharmacyNo,cri);
	}

	// 약배달 등록/ 취소 총 갯수
	@Override
	public int memDeliveryCount(int pharmacyNo) {
		return deliveryMapper.memDeliveryCount(pharmacyNo);
	}

	// K. 약배달목록 총 갯수
	@Override
	public int phaSelectOneCount(int pharmacyNo) {
		return deliveryMapper.phaSelectOneCount(pharmacyNo);
	}

	// K. 배달완료 총 갯수
	@Override
	public int phaCompleteDelCount(int pharmacyNo) {
		return deliveryMapper.phaCompleteDelCount(pharmacyNo);
	}

	// K.10/21 약국이름, 약국 한건 조회
	@Override
	public MedDeliveryVO phaNameSelectOne(int bookingNo) {
		return deliveryMapper.phaNameSelectOne(bookingNo);
	}

}
