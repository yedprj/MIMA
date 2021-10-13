package com.mima.app.doc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mima.app.criteria.domain.Criteria;
import com.mima.app.doc.domain.DocInfoVO;
import com.mima.app.doc.domain.PartnerDoctorVO;
import com.mima.app.doc.mapper.MentalSubjectMapper;
import com.mima.app.doc.mapper.PartnerDoctorMapper;
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
		
		partnerDoctorMapper.docProfileInsert(vo); //doc table에 인서트
		
	//첨부파일 등록 (첨부파일 테이블에) 교재 567
		if (vo.getAttachFile() == null) {
			return 2;
		}
		// BoardServiceImpl 참고
		//여기 그냥 메딧어태치 보 쓰고 같은 테이블 사용함
		MeditAttachVO attach =vo.getAttachFile();
						
		System.out.println("첨부파일 인서트 제발 좀 들어가-"+attach+"meditationServiceImpl");
		attachMapper.insertImg(attach);

		return 1;
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

	// 닥터 대쉬보드 병원 이름_J13
	@Override
	public String clinicName(int memberNo) {
		return partnerDoctorMapper.clinicName(memberNo);
	}



}
