package com.mima.app.member.service;

import java.util.List;

import com.mima.app.member.domain.MemberVO;

public interface MemberService {

	// 한건 조회 및 아이디 중복 체크
	public int idCheck(MemberVO vo);
	
	// 닉네임 중복 체크
	public int nickNameCheck(MemberVO vo);

	// 의사 약사 면허 체크
	public int licenseCheck(MemberVO vo);	

	// 회원가입
	public int memberInsert(MemberVO vo);

	// 파트너 회원가입 (의사/약사)
	public int partnerMemberInsert(MemberVO vo);	
	
	// 파트너 의사 / 약국 승인 유무 검색
	public List<MemberVO> patnerStatusSelect();
	
	// 파트너 의사 / 약국 승인 등록
	public int patnerStatusUpdate(MemberVO vo);
}
