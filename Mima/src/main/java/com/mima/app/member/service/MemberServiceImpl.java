package com.mima.app.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mima.app.member.domain.MemberBookingVO;
import com.mima.app.member.domain.MemberVO;
import com.mima.app.member.mapper.MemberMapper;
import com.mima.app.session.domain.PtInfoVO;

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

	// 비밀번호 초기화 시 멤버 테이블 비밀번호 업데이트 p.30
	@Override
	public int passwordResetUpdate(MemberVO vo) {
		return memberMapper.passwordResetUpdate(vo);
	}
	
	// Session에 vo객체를 담을려고 추가 p.30
	@Override
	public MemberVO getUserById(String memberId) {
		MemberVO mvo = memberMapper.getUserById(memberId);
		return mvo;
	}
	
	// status가 y인 의사 조회 p.10/04
	@Override
	public List<MemberVO> selectDoctorY() {
		return memberMapper.selectDoctorY();
	}

	// 닥터 비밀번호 변경_J04
	@Override
	public int docPwChange(MemberVO vo) {
		return memberMapper.docPwChange(vo);
	}

	// 환자 대쉬보드 비밀번호 변경 e.11
	@Override
	public int ptPwChange(MemberVO vo) {
		return memberMapper.ptPwChange(vo);
	}
	
	// 닥터 나의 환자들 조회_J06
	@Override
	public List<MemberBookingVO> patientList(int memberNo) {
		return memberMapper.patientList(memberNo);
	}

	@Override
	public PtInfoVO getCnote(PtInfoVO vo) {
		return memberMapper.getCnote(vo);
	}

	// 약배달 신청유무 변경 K.10/11
	@Override
	public int deliveryStatusUpdate(MemberVO vo) {
		return memberMapper.deliveryStatusUpdate(vo);
	}

	// 약배달 신청 유무 확인 K.10/11
	@Override
	public String deliveryStatus(int memberNo) {
		return memberMapper.deliveryStatus(memberNo);
	}

	// 현재 비밀번호 확인을 위해 DB에 저장된 비밀번호 가져오기 p.10/11
	@Override
	public MemberVO findPassword1(String memberId) {
		return memberMapper.findPassword1(memberId);
	}

	// 의사 비밀번호 변경 p.10/11
	@Override
	public int updatePassword(MemberVO vo) {
		return memberMapper.updatePassword(vo);
	}

}
