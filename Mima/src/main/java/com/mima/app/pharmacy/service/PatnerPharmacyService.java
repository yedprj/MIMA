package com.mima.app.pharmacy.service;

import com.mima.app.pharmacy.domain.PartnerPharmacyVO;

public interface PatnerPharmacyService {

	// [K] 210929 - 약국한건조회
	public PartnerPharmacyVO selectOne(PartnerPharmacyVO vo);
	
	// [K] 210929 - 약국 프로필 수정
	public int profileUpdate(PartnerPharmacyVO vo);
	
}
