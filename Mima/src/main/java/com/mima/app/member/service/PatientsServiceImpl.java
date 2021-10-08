package com.mima.app.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mima.app.admin.domain.CscVO;
import com.mima.app.admin.domain.QnaVO;
import com.mima.app.comments.domain.CommentsVO;
import com.mima.app.criteria.domain.Criteria;
import com.mima.app.doc.domain.PartnerDoctorVO;
import com.mima.app.member.domain.PatientsVO;
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

	//환자대쉬보드 예약관리 페이지 e.5
	@Override
	public List<BookingVO> ptbmList(int memberNo) {
		return patientsMapper.ptbmList(memberNo);
	}

	//전체조회 예약관리 페이징 e.5
	@Override
	public List<BookingVO> getPtbmList(Criteria cri) {
		return patientsMapper.getPtbmList(cri);
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

	//환자대쉬보드 진료내역 페이지 e.5
	@Override
	public List<BookingVO> ptHistoryList(int memberNo) {
		return patientsMapper.ptHistoryList(memberNo);
	}

	//전체조회 진료내역 페이징 e.6
	@Override
	public List<BookingVO> getPthList(Criteria cri) {
		return patientsMapper.getPthList(cri);
	}

	//전체 데이터 수 조회 진료내역 페이징 e.6
	@Override
	public int getTotalPthCount(Criteria cri) {
		return patientsMapper.getTotalPthCount(cri);
	}
	
	//환자대쉬보드 Main 나의후기 e.5
	@Override
	public List<CommentsVO> ptMainreList(int memberNo) {
		return patientsMapper.ptMainreList(memberNo);
	}

	//환자대쉬보드 나의후기 페이지 e.5
	@Override
	public List<CommentsVO> ptReviewList(int memberNo) {
		return patientsMapper.ptReviewList(memberNo);
	}

	//전체조회 나의후기 페이징 e.6
	@Override
	public List<CommentsVO> getPtrvList(Criteria cri) {
		return patientsMapper.getPtrvList(cri);
	}

	//전체 데이터 수 조회 나의후기 페이징 e.6
	@Override
	public int getTotalPtrvCount(Criteria cri) {
		return patientsMapper.getTotalPtrvCount(cri);
	}

	//환자대쉬보드 나의문의 페이지 e.6
	@Override
	public List<QnaVO> ptQna(int memberNo) {
		return patientsMapper.ptQna(memberNo);
	}

	//전체조회 나의문의 페이징 e.7
	@Override
	public List<QnaVO> getPtqList(Criteria cri) {
		return patientsMapper.getPtqList(cri);
	}

	//전체 데이터 수 조회 나의문의 페이징 e.7
	@Override
	public int getTotalPtqCount(Criteria cri) {
		return patientsMapper.getTotalPtqCount(cri);
	}
	
}
