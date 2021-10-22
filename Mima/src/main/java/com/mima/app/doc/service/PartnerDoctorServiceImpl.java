package com.mima.app.doc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mima.app.criteria.domain.Criteria;
import com.mima.app.doc.domain.DocInfoVO;
import com.mima.app.doc.domain.PartnerDoctorVO;
import com.mima.app.doc.mapper.MentalSubjectMapper;
import com.mima.app.doc.mapper.PartnerDoctorMapper;
import com.mima.app.likes.domain.LikesVO;
import com.mima.app.meditation.domain.MeditAttachVO;
import com.mima.app.meditation.mapper.MeditAttachMapper;
import com.mima.app.member.domain.ExperienceVO;
import com.mima.app.member.domain.MemberVO;
import com.mima.app.member.mapper.ExperienceMapper;

@Service
public class PartnerDoctorServiceImpl implements PartnerDoctorService {

	@Autowired PartnerDoctorMapper partnerDoctorMapper;
	@Autowired MeditAttachMapper attachMapper;
	@Autowired MentalSubjectMapper mentalSubjectMapper;
	@Autowired ExperienceMapper experienceMapper;
	
	// s:1006 의사프로필 인서트 + 첨부파일(프로필 사진 인서트)
	@Override
	public int docProfileInsert(PartnerDoctorVO vo) {
		System.out.println("니뭐고--------------------" + vo);
		return partnerDoctorMapper.docProfileInsert(vo);
		
	}


	//s:1007 프로필 등록 시 주소 멤버 테이블에 업데이트
	@Override
	public int docAddrUpdate(MemberVO vo) {
		return partnerDoctorMapper.docAddrUpdate(vo);
	}

	

	//s:1008 의사 전체 숫자조회 
	@Override
	public int totalDocNumCount(Criteria cri) {
		return partnerDoctorMapper.totalDocNumCount(cri);
	}

	//s:1008 의사 전체 리스트 
	@Override
	public List<DocInfoVO> getTotalDocList(Criteria cri) {
		return partnerDoctorMapper.getTotalDocList(cri);
	}

	//s:1008 의사 디테일 페이지
	@Override
	public DocInfoVO getDocDetail(DocInfoVO vo) {
		vo=partnerDoctorMapper.getDocDetail(vo); //의사 디테일 조회해서 담음
		int docNo = vo.getMemberNo();

		vo.setSubjects(mentalSubjectMapper.getPriceCategory(docNo)); //진단과목 가격 담기
		
		ExperienceVO expVo = new ExperienceVO();
		expVo.setMemberNo(docNo);
		vo.setExp(experienceMapper.getExpList(expVo));
		
		System.out.println("진료과목담고 service impl "+vo.getSubjects());
		return vo;
	}

	//s:1010 의사 프로필 유무 체크
	@Override
	public DocInfoVO checkDocDetail(MemberVO vo) {
		return partnerDoctorMapper.checkDocDetail(vo);
	}

	//s:1020 의사 프로필 학력 조회
	@Override
	public DocInfoVO checkEduDetail(MemberVO vo) {
		return partnerDoctorMapper.checkEduDetail(vo);
	}

	//s:1020 의사 프로필 학력 입력
	@Override
	public int insertEduAjax(PartnerDoctorVO vo) {
		return partnerDoctorMapper.insertEduAjax(vo);
	}

	//s:1020  의사 프로필 페이지 학력수정 ajax 
	@Override
	public int updateEduAjax(PartnerDoctorVO vo) {
		return partnerDoctorMapper.updateEduAjax(vo);
	}

	// 닥터 대쉬보드 병원 이름_J13
	@Override
	public String clinicName(int memberNo) {
		return partnerDoctorMapper.clinicName(memberNo);
	}

	// p.10/14 의사 진료과목에 대한 리스트
	@Override
	public List<DocInfoVO> subjectDoclist(String category1, String category2, String category3) { 
		return partnerDoctorMapper.subjectDoclist(category1, category2, category3);
	}

	// e.17 환자대쉬보드 의사 좋아요 삭제
	@Override
	public int deleteDocLike(LikesVO vo) {
		return partnerDoctorMapper.deleteDocLike(vo);
	}


}
