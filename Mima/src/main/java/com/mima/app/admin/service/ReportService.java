package com.mima.app.admin.service;

import java.util.List;

import com.mima.app.admin.domain.ReportVO;
import com.mima.app.admin.domain.RmemberVO;

public interface ReportService {

	public int insert(ReportVO vo);
	
	public ReportVO reportRead(ReportVO vo);
	
	public int delete(ReportVO vo);
	
	//관리자 신고 전체 조회
	public List<ReportVO> adminGetList(); 

	//관리자 신고 삭제
	public int adminDelete(ReportVO vo);
	
	// 신고 당한 사람 한 사람 조회
	public List<RmemberVO> rmemberReportSelect();
	
	//관리자 신고 단건 조회
	public RmemberVO rmemberReportSelect(RmemberVO vo);
	
}
