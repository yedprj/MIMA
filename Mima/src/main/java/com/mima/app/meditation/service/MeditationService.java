package com.mima.app.meditation.service;

import java.util.List;

import com.mima.app.meditation.domain.MeditationVO;

public interface MeditationService {
	//전체 조회
		public List<MeditationVO> getMeditationList();
		
		//한 조회
		public MeditationVO read(MeditationVO vo);
		
		//입력
		public int insert(MeditationVO vo);
		
		//수정
		public int update(MeditationVO vo);
		
		//삭제
		public int delete(MeditationVO vo);
}
