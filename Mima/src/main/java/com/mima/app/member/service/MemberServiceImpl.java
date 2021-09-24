package com.mima.app.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mima.app.member.domain.MemberVO;
import com.mima.app.member.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired MemberMapper memberMapper;
	
	// 아이디 중복 체크
	@Override
	public int idCheck(MemberVO vo) {
		return memberMapper.idCheck(vo);
	}

	// 닉네임 중복 체크
	@Override
	public int nickNameCheck(MemberVO vo) {
		return memberMapper.nickNameCheck(vo);
	}
	
	// 회원가입
	@Override
	public int memberInsert(MemberVO vo) {
		return memberMapper.memberInsert(vo);
	}

	// 파트너 의사 / 약국 승인 유무 검색
	@Override
	public List<MemberVO> patnerStatusSelect() {
		return memberMapper.patnerStatusSelect();
	}

	// 파트너 의사 / 약국 승인 등록
	@Override
	public int patnerStatusUpdate(MemberVO vo) {
		return memberMapper.patnerStatusUpdate(vo);
	}

}
