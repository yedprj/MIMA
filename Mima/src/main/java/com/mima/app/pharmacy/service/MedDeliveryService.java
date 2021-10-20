package com.mima.app.pharmacy.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mima.app.criteria.domain.Criteria;
import com.mima.app.pharmacy.domain.MedDeliveryVO;
import com.mima.app.pharmacy.domain.MemDeliveryVO;

public interface MedDeliveryService {

	// K.10/13 약배달 등록 /취소 조회
		public List<MemDeliveryVO> memDelivery(@Param("pharmacyNo") int pharmacyNo,@Param("cri") Criteria cri);
		
		// K.10/21 약배달 등록/취소 총 갯수
		public int memDeliveryCount(int pharmacyNo);
		
		// K.10/09 약배달 신청 한건 조회
		public MedDeliveryVO selectOne(int bookingNo);
		
		// K.10/13 약배달 상태 변경
		public int deliveryStatusUpdate(MedDeliveryVO vo);
		
		// k. 10/14 약배달 취소
		public int delCancel(MedDeliveryVO vo);
		
		// K.10/14 약배달 목록 조회
		public List<MedDeliveryVO> phaSelectOne(@Param("pharmacyNo") int pharmacyNo,@Param("cri") Criteria cri);
		
		// K.10/21 약배달 목록 조회 총 갯수
		public int phaSelectOneCount(int pharmacyNo);
		
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
		
		// K.10/19 환자 약배달 수령 후 상태 변경
		public int delcompleteUpdate(MedDeliveryVO vo);
		
		// K. 10/19 환자 약배달 재신청
		public int delReapply(MedDeliveryVO vo);
		
		// K. 10/19 약국 배달완료 건수 조회
		public List<MemDeliveryVO> phaCompleteDel(@Param("pharmacyNo") int pharmacyNo,@Param("cri") Criteria cri);
		
		// K.10/21 약배달 배달완료 총 갯수
		public int phaCompleteDelCount(int pharmacyNo);
		
		// K.10/21 약국이름, 약국 한건 조회
		public MedDeliveryVO phaNameSelectOne(int bookingNo);
	
}
