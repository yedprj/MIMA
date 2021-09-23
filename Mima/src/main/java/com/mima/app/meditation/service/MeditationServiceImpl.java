package com.mima.app.meditation.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mima.app.criteria.domain.Criteria;
import com.mima.app.meditation.domain.MeditationVO;
import com.mima.app.meditation.mapper.MeditationMapper;

@Service
public class MeditationServiceImpl implements MeditationService {

	@Autowired
	MeditationMapper meditationMapper;
	
	@Override
	public List<MeditationVO> getMeditationList(Criteria cri) {
		return meditationMapper.getMeditationList(cri);
	}

	@Override
	public MeditationVO read(MeditationVO vo) {
		return meditationMapper.read(vo);
	}

	@Override
	public int insert(MeditationVO vo) {
		return meditationMapper.insert(vo);
	}

	@Override
	public int update(MeditationVO vo) {
		return meditationMapper.update(vo);
	}

	@Override
	public int delete(MeditationVO vo) {
		return meditationMapper.delete(vo);
	}

	@Override
	public int getTotalMeditCount(Criteria cri) {
		return meditationMapper.getTotalMeditCount(cri);
	}



}
