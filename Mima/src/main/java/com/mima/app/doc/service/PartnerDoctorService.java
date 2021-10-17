package com.mima.app.doc.service;

import java.util.List;


import com.mima.app.criteria.domain.Criteria;
import com.mima.app.doc.domain.DocInfoVO;
import com.mima.app.doc.domain.PartnerDoctorVO;
import com.mima.app.likes.domain.LikesVO;
import com.mima.app.member.domain.MemberVO;

public interface PartnerDoctorService {

	// 닥터 대쉬보드 프로필 페이지 INSERT_J04
	public int docProfileInsert(PartnerDoctorVO vo);
	
	
	
	// s:1007 프로필 등록 시 주소 멤버 테이블에 업데이트
	public int docAddrUpdate(MemberVO vo);
	
	//s:1008 전체 의사 멤버 수 조회
	public int totalDocNumCount(Criteria cri);
	
	//s:1008 의사 전체 리스트 
	public List<DocInfoVO> getTotalDocList(Criteria cri);
	
	//s:1008 의사 디테일 페이지
	public DocInfoVO getDocDetail(DocInfoVO vo);
	
	//s:1010 의사프로필 유무 확인
	public DocInfoVO checkDocDetail(MemberVO vo);
	
	// 닥터 대쉬보드 병원 이름_J13
	public String clinicName(int memberNo);
	
	// p.10/14 의사 진료과목에 대한 리스트
	public List<DocInfoVO> subjectDoclist(String category1, String category2, String category3);
	
	// e.17 환자대쉬보드 의사 좋아요 삭제
	public int deleteDocLike(LikesVO vo);

}