package com.mima.app.pharmacy.mapper;

import java.util.List;

import com.mima.app.criteria.domain.Criteria;
import com.mima.app.member.domain.MemberVO;
import com.mima.app.pharmacy.domain.PartnerPharmacyVO;

public interface PartnerPharmacyMapper {

	// [K] 210929 - 약국한건조회
	public PartnerPharmacyVO selectOne(int memberNo);

	// [K] 210929 - 약국 프로필 수정
	public int profileUpdate(PartnerPharmacyVO vo);
	
	// [K] 211007 - 약국 검색
	public List<PartnerPharmacyVO> pharmacySearch(Criteria cri);
	
	// k.10/11 - 약국 수정시 멤버 주소 변경
	public int phaAddrUpdate(MemberVO vo);
	
}
