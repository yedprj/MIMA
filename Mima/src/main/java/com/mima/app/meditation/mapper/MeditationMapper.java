package com.mima.app.meditation.mapper;

import java.util.List;

import com.mima.app.criteria.domain.Criteria;
import com.mima.app.meditation.domain.MeditationVO;

public interface MeditationMapper {
	
	//입력
	public int insert(MeditationVO vo);
	
	//수정
	public int update(MeditationVO vo);
	
	//삭제
	public int delete(MeditationVO vo);

	//한건 조회
	public MeditationVO read(MeditationVO vo);

	//전체 조회
	public List<MeditationVO> getMeditationList(Criteria cri);
	
	//전체 명상 컨텐츠 리스트 수 조회
	public int getTotalMeditCount(Criteria cri);
}
