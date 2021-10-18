package com.mima.app.pharmacy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mima.app.criteria.domain.Criteria;
import com.mima.app.pharmacy.domain.MedDeliveryVO;
import com.mima.app.pharmacy.domain.MemDeliveryVO;

public interface MedDeliveryMapper {
	
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
	
	// K.10/14 오늘의 약배달 수
	public int deliveryCnt(int pharmacyNo);
	
	// K.10/14 오늘의 약배달 신청건수 조회
	public List<MemDeliveryVO> todayDelivery(int pharmacyNo);
	
	// K. 10/14 복약지도수
	public int ptEducationCnt(int pharmacyNo);
	
	// K. 10/14 복약지도관리
	public List<MemDeliveryVO> ptEducation(@Param("pharmacyNo") int pharmacyNo,@Param("cri") Criteria cri);
	
	// K.10/14 복약지도 완료처리
	public int ptEduStatusUpdate(int bookingNo);
	
	// K.10/18 환자 약배달 취소 내역 조회
	public MedDeliveryVO delCancelReason(int bookingNo);
}
