package com.mima.app.doc.service;

import com.mima.app.doc.domain.PartnerDoctorVO;
import com.mima.app.member.domain.MemberVO;

public interface PartnerDoctorService {

	// 닥터 대쉬보드 프로필 페이지 INSERT_J04
	public int docProfileInsert(PartnerDoctorVO vo);
	
	// s:1007 프로필 등록 시 주소 멤버 테이블에 업데이트
	public int docAddrUpdate(MemberVO vo);
	

}