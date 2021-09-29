package com.mima.app.admin.service;

import java.util.List;

import com.mima.app.admin.domain.ReportVO;
import com.mima.app.admin.domain.RmemberVO;
import com.mima.app.criteria.domain.Criteria;

public interface ReportService {

	public int insert(ReportVO vo);
	
	public ReportVO reportRead(ReportVO vo);
	
	public int delete(ReportVO vo);

	//e.29
	//관리자 신고당한사람 삭제
	public int adminDelete(ReportVO vo);
	
	//e.29
	//관리자 신고당한사람 전체조회
	public List<RmemberVO> rmemberReportSelect();
	
	//e.29
	//관리자 신고당한사람 단건조회
	public RmemberVO rmemberReportSelect(RmemberVO vo);
	
	//e.29
	//페이징
	public List<ReportVO> getList(Criteria cri);
		
	//e.29
	//페이징
	public int getTotalCount(Criteria cri);
}
