package com.mima.app.admin.mapper;

import java.util.List;

import com.mima.app.admin.domain.ReportVO;
import com.mima.app.admin.domain.RmemberVO;
import com.mima.app.criteria.domain.Criteria;

public interface ReportMapper {
	
	// 포스트 신고 성공
	public int insert(ReportVO vo);
	
	// 포스트 신고 한건 조회
	public ReportVO reportRead(ReportVO vo);
	
	// 포스트 신고 취소
	public int delete(ReportVO vo);
	
	//e.29
	//관리자 신고당한사람 삭제
	public int adminDelete(ReportVO vo);
	
	//e.29
	//관리자 신고당한사람 전체조회
	public List<RmemberVO> rmemberReportSelectList();
	
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
