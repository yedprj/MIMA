package com.mima.app.pharmacy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mima.app.criteria.domain.Criteria;
import com.mima.app.member.domain.MemberVO;
import com.mima.app.pharmacy.domain.PartnerPharmacyVO;
import com.mima.app.pharmacy.mapper.PartnerPharmacyMapper;

@Service
public class PatnerPharmacyServiceImpl implements PatnerPharmacyService {

	@Autowired PartnerPharmacyMapper partPhaMapper;
	
	// [K]210929 - 약국한건조회
	@Override
	public PartnerPharmacyVO selectOne(int memberNo) {
		return partPhaMapper.selectOne(memberNo);
	}

	// [K] 210929 - 약국 프로필 수정
	@Override
	public int profileUpdate(PartnerPharmacyVO vo) {
		return partPhaMapper.profileUpdate(vo);
	}

	// [K] 211007 - 약국 검색
	@Override
	public List<PartnerPharmacyVO> pharmacySearch(Criteria cri) {
		return partPhaMapper.pharmacySearch(cri);
	}
	
	// k.10/11 - 약국 수정시 멤버 주소 변경
	@Override
	public int phaAddrUpdate(MemberVO vo) {
		return partPhaMapper.phaAddrUpdate(vo);
	}

}
