package com.mima.app.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mima.app.member.domain.MemberVO;
import com.mima.app.member.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired MemberMapper memberMapper;
	
	@Override
	public int idCheck(MemberVO vo) {
		return memberMapper.idCheck(vo);
	}

	@Override
	public int nickNameCheck(MemberVO vo) {
		return memberMapper.nickNameCheck(vo);
	}

}
