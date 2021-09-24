package com.mima.app.admin.mapper;

import com.mima.app.admin.domain.ReportVO;

public interface ReportMapper {
	
	public int insert(ReportVO vo);
	
	public ReportVO reportRead(ReportVO vo);
	
	public int delete(ReportVO vo);
	
	

}
