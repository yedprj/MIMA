package com.mima.app.member.mapper;

import com.mima.app.member.domain.MemberVO;

public interface MemberMapper {
	
	// 아이디 중복 체크
	public int idCheck(MemberVO vo);
	
	// 닉네임 중복 체크
	public int nickNameCheck(MemberVO vo);
	
	// 일반 회원가입
	public int memberInsert(MemberVO vo);
	
	// 파트너 회원가입 (의사/약사)
	public int partnerMemberInsert(MemberVO vo);
}
