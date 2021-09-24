package com.mima.app.admin.service;

import com.mima.app.admin.domain.ReportVO;

public interface ReportService {

	public int insert(ReportVO vo);
	
	public ReportVO reportRead(ReportVO vo);
	
	public int delete(ReportVO vo);
	
}
