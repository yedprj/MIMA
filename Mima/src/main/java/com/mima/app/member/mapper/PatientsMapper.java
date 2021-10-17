package com.mima.app.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mima.app.admin.domain.QnaVO;
import com.mima.app.comments.domain.CommentsVO;
import com.mima.app.criteria.domain.Criteria;
import com.mima.app.doc.domain.DocInfoVO;
import com.mima.app.doc.domain.PartnerDoctorVO;
import com.mima.app.likes.domain.LikesVO;
import com.mima.app.member.domain.MemberVO;
import com.mima.app.member.domain.PatientsVO;
import com.mima.app.pharmacy.domain.PartnerPharmacyVO;
import com.mima.app.session.domain.BookingVO;

public interface PatientsMapper {
	
	//s:1004 자가진단표+정보 입력
	public int update(PatientsVO vo);
	//s:1004 자가진단표
	public int updateAx(PatientsVO vo);

	//관리자 회원정보조회 토탈카운트 e.13
	public int getTotalCount();
	
	//관리자 회원정보조회(환자) e.29
	public List<PatientsVO> getptList();
	
	//관리자 회원정보조회(의사) e.7
	public List<PartnerDoctorVO> getdocList();
	
	//관리자 회원정보조회(약국) e.7
	public List<PartnerPharmacyVO> getpmList();
	
	//관리자 회원정보조회(환자) 전체조회 페이징 e.4
	public List<PatientsVO> getPatientsList(Criteria cri);

	//관리자 회원정보조회(환자) 전체 데이터 수 조회 페이징 e.4
	public int getTotalPatientsCount(Criteria cri);
	
	//관리자 회원정보조회(의사) 전체조회 페이징 e.7
	public List<PartnerDoctorVO> getdoctorList(Criteria cri);
	
	//관리자 회원정보조회(의사) 전체 데이터 수 조회 페이징 e.7
	public int getTotaldoctorCount(Criteria cri);
	
	//관리자 회원정보조회(약국) 전체조회 페이징 e.8
	public List<PartnerPharmacyVO> getpharList(Criteria cri);
	
	//관리자 회원정보조회(약국) 전체 데이터 수 조회 페이징 e.8
	public int getTotalpharCount(Criteria cri);
	
	//환자대쉬보드 Main 오늘의예약 e.4
	public List<BookingVO> ptgetList(int memberNo);

	//환자대쉬보드 예약관리 페이지,페이징 e.5
	public List<BookingVO> ptbmList(@Param("memberNo") int memberNo, @Param("cri") Criteria cri);
	
	//전체 데이터 수 조회 예약관리 페이징 e.5
	public int getTotalPtbmCount(Criteria cri);
	
	//환자대쉬보드 Main 진료내역 e.5
	public List<BookingVO> ptMainhisList(int memberNo);
	
	//환자대쉬보드 진료내역 페이지,페이징 e.5
	public List<BookingVO> ptHistoryList(@Param("memberNo") int memberNo, @Param("cri") Criteria cri);
	
	//전체 데이터 수 조회 진료내역 페이징 e.6
	public int getTotalPthCount(Criteria cri);
	
	//환자대쉬보드 내가 찜한 의사 e.14
	public List<LikesVO> ptDoctor(int memberNo);
	
	//환자대쉬보드 Main 나의후기 e.5
	public List<CommentsVO> ptMainreList(int memberNo);

	//환자대쉬보드 나의후기 페이지,페이징 e.5
	public List<CommentsVO> ptReviewList(@Param("memberNo") int memberNo, @Param("cri") Criteria cri);
	
	//전체 데이터 수 조회 나의후기 페이징 e.6
	public int getTotalPtrvCount(Criteria cri);
	
	//환자 대쉬보드 프로필 관리 한건조회 e.12
	public MemberVO ptSelectOne(int memberNo);
	
	//환자 대쉬보드 프로필 수정 e.12
	public int ptprofileUpdate(MemberVO vo);
	
	// 약배달 신청내역 조회 K.10/10
	public PatientsVO ptDeliveryCheck(int memberNo);
	
	// 약배달 정보 등록 K.10/10
	public int ptDeliveryInsert(PatientsVO vo);
	
	// 약배달 정보 수정 K.10/10
	public int ptDeliveryUpdate(PatientsVO vo);
	
	// 환자 대쉬보드 메인 나의 예약수 카운트_J17
	public int ptMyListCount (int memberNo);
	
	// 환자 대쉬보드 메인 진료내역 수 카운트_J17
	public int ptMyHistoryCount (int memberNo);
	
	// 환자 대쉬보드 메인 나의 후기수 카운트_J17
	public int ptMyReviewCount (int memberNo);
	
}
