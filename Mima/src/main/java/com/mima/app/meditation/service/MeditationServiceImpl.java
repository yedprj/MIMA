package com.mima.app.meditation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mima.app.meditation.domain.MeditationVO;
import com.mima.app.meditation.mapper.MeditationMapper;

@Service
public class MeditationServiceImpl implements MeditationService {

	@Autowired
	MeditationMapper meditationMapper;
	
	@Override
	public List<MeditationVO> getMeditationList() {
		// TODO Auto-generated method stub
		return meditationMapper.getMeditationList();
	}

	@Override
	public MeditationVO read(MeditationVO vo) {
		// TODO Auto-generated method stub
		return meditationMapper.read(vo);
	}

	@Override
	public int insert(MeditationVO vo) {
		// TODO Auto-generated method stub
		return meditationMapper.insert(vo);
	}

	@Override
	public int update(MeditationVO vo) {
		// TODO Auto-generated method stub
		return meditationMapper.update(vo);
	}

	@Override
	public int delete(MeditationVO vo) {
		// TODO Auto-generated method stub
		return meditationMapper.delete(vo);
	}

}
