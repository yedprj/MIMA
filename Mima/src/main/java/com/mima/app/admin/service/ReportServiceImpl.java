package com.mima.app.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mima.app.admin.domain.ReportVO;
import com.mima.app.admin.domain.RmemberVO;
import com.mima.app.admin.mapper.ReportMapper;

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

	@Override
	public List<ReportVO> adminGetList() {
		return reportMapper.adminGetList();
	}

	@Override
	public ReportVO adminRead(ReportVO vo) {
		return reportMapper.adminRead(vo);
	}

	@Override
	public int adminDelete(ReportVO vo) {
		return reportMapper.adminDelete(vo);
	}

	@Override
	public List<RmemberVO> rmemberReportSelect() {
		return reportMapper.rmemberReportSelect();
	}

}
