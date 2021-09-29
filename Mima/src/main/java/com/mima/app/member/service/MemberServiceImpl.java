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
	
	// 의사 약사 면허 체크
	@Override
	public int licenseCheck(MemberVO vo) {
		return memberMapper.licenseCheck(vo);
	}
	
	// 아이디 찾기 p-29
	@Override
	public String findMemberId(MemberVO vo) {
		return memberMapper.findMemberId(vo);
	}
	
	// 비밀번호 찾기 p-29
	@Override
	public int findPassword(MemberVO vo) {
		return memberMapper.findPassword(vo);
	}
	
	// 로그인
	@Override
	public MemberVO memberLogin(MemberVO vo) {
		return memberMapper.memberLogin(vo);
	}
	
	// 회원가입
	@Override
	public int memberInsert(MemberVO vo) {
		return memberMapper.memberInsert(vo);
	}

	// 파트너 회원가입
	@Override
	public int partnerMemberInsert(MemberVO vo) {
		return memberMapper.partnerMemberInsert(vo);
	}

	//e.29
	// 파트너 의사 / 약국 승인 유무 검색
	@Override
	public List<MemberVO> patnerStatusSelect() {
		return memberMapper.patnerStatusSelect();
	}

	//e.29
	// 파트너 의사 / 약국 승인 등록
	@Override
	public int patnerStatusUpdate(MemberVO vo) {
		return memberMapper.patnerStatusUpdate(vo);
	}

}
