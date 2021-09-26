package com.mima.app.admin.mapper;

import com.mima.app.admin.domain.ReportVO;

public interface ReportMapper {
	
	// 포스트 신고 성공
	public int insert(ReportVO vo);
	
	// 포스트 신고 한건 조회
	public ReportVO reportRead(ReportVO vo);
	
	// 포스트 신고 취소
	public int delete(ReportVO vo);
	
	

}
