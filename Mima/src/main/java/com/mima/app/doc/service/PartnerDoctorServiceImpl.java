package com.mima.app.doc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mima.app.doc.domain.PartnerDoctorVO;
import com.mima.app.doc.mapper.PartnerDoctorMapper;
import com.mima.app.meditation.domain.MeditAttachVO;
import com.mima.app.meditation.mapper.MeditAttachMapper;

@Service
public class PartnerDoctorServiceImpl implements PartnerDoctorService {

	@Autowired PartnerDoctorMapper partnerDoctorMapper;
	@Autowired MeditAttachMapper attachMapper;
	
	
	// s:1006 의사프로필 인서트 + 첨부파일(프로필 사진 인서트)
	@Override
	public int docProfileInsert(PartnerDoctorVO vo) {
		
		partnerDoctorMapper.docProfileInsert(vo); //doc table에 인서트
		
		//첨부파일 등록 (첨부파일 테이블에) 교재 567
				if (vo.getAttachFile() == null) {
					return 2;
				}
				// BoardServiceImpl 참고
				
				MeditAttachVO attach =vo.getAttachFile();
								
				System.out.println("첨부파일 인서트 제발 좀 들어가-"+attach+"meditationServiceImpl");
				attachMapper.insert(attach);

				return 1;
	}

	
	

	

}
