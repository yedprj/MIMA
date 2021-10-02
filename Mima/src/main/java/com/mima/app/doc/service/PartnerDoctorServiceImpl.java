package com.mima.app.doc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mima.app.doc.domain.PartnerDoctorVO;
import com.mima.app.doc.mapper.PartnerDoctorMapper;

@Service
public class PartnerDoctorServiceImpl implements PartnerDoctorService {

	@Autowired PartnerDoctorMapper doctorMapper;
	
	// 닥터 대쉬보드 프로필 페이지_J02
	@Override
	public List<PartnerDoctorVO> docProfile() {
		return doctorMapper.docProfile();
	}

}
