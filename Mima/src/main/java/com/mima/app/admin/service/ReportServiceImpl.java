package com.mima.app.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mima.app.admin.domain.ReportVO;
import com.mima.app.admin.domain.RmemberVO;
import com.mima.app.admin.mapper.ReportMapper;
import com.mima.app.criteria.domain.Criteria;

@Service
public class ReportServiceImpl implements ReportService {

	@Autowired ReportMapper reportMapper;
	
	@Override
	public int insert(ReportVO vo) {
		// TODO Auto-generated method stub
		return reportMapper.insert(vo);
	}

	@Override
	public ReportVO reportRead(ReportVO vo) {
		// TODO Auto-generated method stub
		return reportMapper.reportRead(vo);
	}

	@Override
	public int delete(ReportVO vo) {
		// TODO Auto-generated method stub
		return reportMapper.delete(vo);
	}

	//e.29
	//관리자 신고당한사람 삭제
	@Override
	public int adminDelete(ReportVO vo) {
		return reportMapper.adminDelete(vo);
	}

	//e.29
	//관리자 신고당한사람 전체조회
	@Override
	public List<RmemberVO> rmemberReportSelectList() {
		return reportMapper.rmemberReportSelectList();
	}

	//e.29
	//관리자 신고당한사람 단건조회
	@Override
	public RmemberVO rmemberReportSelect(RmemberVO vo) {
		return reportMapper.rmemberReportSelect(vo);
	}

	//e.29
	//페이징
	@Override
	public List<RmemberVO> getList(Criteria cri) {
		return reportMapper.getList(cri);
	}

	//e.29
	//페이징
	@Override
	public int getTotalCount(Criteria cri) {
		return reportMapper.getTotalCount(cri);
	}

}
