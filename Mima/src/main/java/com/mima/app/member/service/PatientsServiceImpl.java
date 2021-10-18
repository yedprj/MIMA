package com.mima.app.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mima.app.admin.domain.QnaVO;
import com.mima.app.comments.domain.CommentsVO;
import com.mima.app.criteria.domain.Criteria;
import com.mima.app.doc.domain.DocInfoVO;
import com.mima.app.doc.domain.PartnerDoctorVO;
import com.mima.app.likes.domain.LikesVO;
import com.mima.app.member.domain.MemberVO;
import com.mima.app.member.domain.PatientsVO;
import com.mima.app.member.domain.PtDeliveryVO;
import com.mima.app.member.mapper.PatientsMapper;
import com.mima.app.pharmacy.domain.PartnerPharmacyVO;
import com.mima.app.session.domain.BookingVO;


@Service
public class PatientsServiceImpl implements PatientsService {
	
	@Autowired
	PatientsMapper patientsMapper;

	//s:1004 self assessment extra info
	@Override
	public int update(PatientsVO vo) {
		return patientsMapper.update(vo);
	}
	//s:1004 self assessment result
	@Override
	public int updateAx(PatientsVO vo) {
		return patientsMapper.updateAx(vo);
	}	
	
	//관리자 회원정보조회 토탈카운트 e.13
	@Override
	public int getTotalCount() {
		return patientsMapper.getTotalCount();
	}
	
	//관리자 회원정보조회(환자) e.29
	@Override
	public List<PatientsVO> getptList() {
		return patientsMapper.getptList();
	}
	
	//관리자 회원정보조회(의사) e.7
	@Override
	public List<PartnerDoctorVO> getdocList() {
		return patientsMapper.getdocList();
	}
	
	//관리자 회원정보조회(약국) e.7
	@Override
	public List<PartnerPharmacyVO> getpmList() {
		return patientsMapper.getpmList();
	}
	
	//관리자 회원정보조회(환자) 전체조회 페이징 e.4
	@Override
	public List<PatientsVO> getPatientsList(Criteria cri) {
		return patientsMapper.getPatientsList(cri);
	}

	//관리자 회원정보조회(환자) 전체 데이터 수 조회 페이징 e.4
	@Override
	public int getTotalPatientsCount(Criteria cri) {
		return patientsMapper.getTotalPatientsCount(cri);
	}

	//관리자 회원정보조회(의사) 전체조회 페이징 e.7
	@Override
	public List<PartnerDoctorVO> getdoctorList(Criteria cri) {
		return patientsMapper.getdoctorList(cri);
	}
	
	//관리자 회원정보조회(의사) 전체 데이터 수 조회 페이징 e.7
	@Override
	public int getTotaldoctorCount(Criteria cri) {
		return patientsMapper.getTotaldoctorCount(cri);
	}
	
	//관리자 회원정보조회(약국) 전체조회 페이징 e.8
	@Override
	public List<PartnerPharmacyVO> getpharList(Criteria cri) {
		return patientsMapper.getpharList(cri);
	}
	
	//관리자 회원정보조회(약국) 전체 데이터 수 조회 페이징 e.8
	@Override
	public int getTotalpharCount(Criteria cri) {
		return patientsMapper.getTotalpharCount(cri);
	}
	
	//환자대쉬보드 Main 오늘의예약 e.4
	@Override
	public List<BookingVO> ptgetList(int memberNo) {
		return patientsMapper.ptgetList(memberNo);

	}

	//환자대쉬보드 예약관리 페이지,페이징 e.5
	@Override
	public List<BookingVO> ptbmList(int memberNo, Criteria cri) {
		return patientsMapper.ptbmList(memberNo, cri);
	}

	//전체 데이터 수 조회 예약관리 페이징 e.5
	@Override
	public int getTotalPtbmCount(Criteria cri) {
		return patientsMapper.getTotalPtbmCount(cri);
	}
	
	//환자대쉬보드 Main 진료내역 e.5
	@Override
	public List<BookingVO> ptMainhisList(int memberNo) {
		return patientsMapper.ptMainhisList(memberNo);
	}

	//환자대쉬보드 진료내역 페이지, 페이징 e.5
	@Override
	public List<BookingVO> ptHistoryList(int memberNo, Criteria cri) {
		return patientsMapper.ptHistoryList(memberNo, cri);
	}

	//전체 데이터 수 조회 진료내역 페이징 e.6
	@Override
	public int getTotalPthCount(Criteria cri) {
		return patientsMapper.getTotalPthCount(cri);
	}
	
	//환자대쉬보드 내가 찜한 의사 e.14
	@Override
	public List<LikesVO> ptDoctor(int memberNo) {
		return patientsMapper.ptDoctor(memberNo);
	}   
	
	//환자대쉬보드 Main 나의후기 e.5
	@Override
	public List<CommentsVO> ptMainreList(int memberNo) {
		return patientsMapper.ptMainreList(memberNo);
	}

	//환자대쉬보드 나의후기 페이지 e.5
	@Override
	public List<CommentsVO> ptReviewList(int memberNo, Criteria cri) {
		return patientsMapper.ptReviewList(memberNo, cri);
	}

	//전체 데이터 수 조회 나의후기 페이징 e.6
	@Override
	public int getTotalPtrvCount(Criteria cri) {
		return patientsMapper.getTotalPtrvCount(cri);
	}
	
	//환자 대쉬보드 프로필 관리 한건조회 e.12
	@Override
	public MemberVO ptSelectOne(int memberNo) {
		return patientsMapper.ptSelectOne(memberNo);
	}
	
	//환자 대쉬보드 프로필 수정 e.12
	@Override
	public int ptprofileUpdate(MemberVO vo) {
		return patientsMapper.ptprofileUpdate(vo);
	}
	
	// 약배달 신청내역 조회 K.10/10
	@Override
	public PatientsVO ptDeliveryCheck(int memberNo) {
		return patientsMapper.ptDeliveryCheck(memberNo);
	}
	
	// 약배달 정보 등록 K.10/10
	@Override
	public int ptDeliveryInsert(PatientsVO vo) {
		return patientsMapper.ptDeliveryInsert(vo);
	}
	
	// 약배달 정보 수정 K.10/10
	@Override
	public int ptDeliveryUpdate(PatientsVO vo) {
		// TODO Auto-generated method stub
		return patientsMapper.ptDeliveryUpdate(vo);
	}
	
	// 환자 5건 약배달현황 조회 K. 10/17
	@Override
	public List<PtDeliveryVO> ptDeliveryStatusList(int memberNo) {
		return patientsMapper.ptDeliveryStatusList(memberNo);
	}
	
	// 환자 대쉬보드 메인 나의 예약수 카운트_J17
	@Override
	public int ptMyListCount(int memberNo) {
		return patientsMapper.ptMyListCount(memberNo);
	}
	
	// 환자 대쉬보드 메인 진료내역 수 카운트_J17
	@Override
	public int ptMyHistoryCount(int memberNo) {
		return patientsMapper.ptMyHistoryCount(memberNo);
	}
	
	// 환자 대쉬보드 메인 나의 후기수 카운트_J17
	@Override
	public int ptMyReviewCount(int memberNo) {
		return patientsMapper.ptMyReviewCount(memberNo);
	}
	// 환자 약배달현황 전체조회
	@Override
	public List<PtDeliveryVO> ptDeliveryStatusAllList(int memberNo) {
		return patientsMapper.ptDeliveryStatusAllList(memberNo);
	}
	
}
