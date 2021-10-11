package com.mima.app.member.mapper;

import java.util.List;

import com.mima.app.member.domain.MemberBookingVO;
import com.mima.app.member.domain.MemberVO;
import com.mima.app.session.domain.PtInfoVO;

public interface MemberMapper {
	
	// 아이디 중복 체크
	public int idCheck(MemberVO vo);
	
	// 닉네임 중복 체크
	public int nickNameCheck(MemberVO vo);
	
	// 의사 약사 면허 체크
	public int licenseCheck(MemberVO vo);
	
	// 아이디 찾기 p-29
	public String findMemberId(MemberVO vo);
	
	// 아이디 이메일로 초기화 유무 묻기 p-29
	public int findPassword(MemberVO vo);
	
	// 로그인
	public MemberVO memberLogin(MemberVO vo);
	
	// 일반 회원가입
	public int memberInsert(MemberVO vo);
	
	// 파트너 회원가입 (의사/약사)
	public int partnerMemberInsert(MemberVO vo);
	
	// status가 y인 의사 조회 p.10/04
	public List<MemberVO> selectDoctorY();

	//e.29
	// 파트너 의사 / 약국 승인 유무 검색
	public List<MemberVO> patnerStatusSelect();
	
	//e.29
	// 파트너 의사 / 약국 승인 등록
	public int patnerStatusUpdate(MemberVO vo);
	
	// 비밀번호 초기화 시 멤버 테이블 비밀번호 업데이트 p.30
	public int passwordResetUpdate(MemberVO vo);
	
	// 유저 세션 유지 위한 p.30
	public MemberVO getUserById(String memberId);
	
	// 닥터 비밀번호 변경_J04
	public int docPwChange(MemberVO vo);
	
	// 환자 대쉬보드 비밀번호 변경 e.11
	public int ptPwChange(MemberVO vo);
	
	// 닥터 나의 환자들 조회_J06
	public List<MemberBookingVO> patientList(int memberNo);
	
	// 닥터 진료내역 페이지 선택한 환자의 진료노트 조회_J10
	public PtInfoVO getCnote(PtInfoVO vo);
	
	// 약배달 신청 유무 변경 K.10/11
	public int deliveryStatusUpdate(MemberVO vo);
	
	// 약배달 신청 유무 확인 K.10/11
	public String deliveryStatus(int memberNo);
	
	// 현재 비밀번호 확인을 위해 DB에 저장된 비밀번호 가져오기 p.10/11
	public MemberVO findPassword1(String memberId);
	
	// 의사 비밀번호 변경 p.10/11
	public int updatePassword(MemberVO vo);

}
