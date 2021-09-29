package com.mima.app.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mima.app.admin.domain.CscVO;
import com.mima.app.admin.mapper.CscMapper;

@Service
public class CscServiceImpl implements CscService {
	
	@Autowired CscMapper cscMapper;

	// 닥터 대쉬보드 나의 문의 페이지_J29
	@Override
	public List<CscVO> docQna() {
		return cscMapper.docQna();
	}

}
