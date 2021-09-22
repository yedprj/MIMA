package com.mima.app.member.service;

import com.mima.app.member.domain.MemberVO;

public interface MemberService {

	// 한건 조회 및 아이디 중복 체크
	public int idCheck(MemberVO vo);
	
	// 닉네임 중복 체크
	public int nickNameCheck(MemberVO vo);	
}
