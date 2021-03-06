package com.mima.app.meditation.service;

import java.util.List;

import com.mima.app.criteria.domain.Criteria;
import com.mima.app.meditation.domain.MeditAttachVO;
import com.mima.app.meditation.domain.MeditationVO;
import com.mima.app.post.domain.PostVO;

public interface MeditationService {
		
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

	//게시글에 첨부된 파일 단건조회...
	public MeditAttachVO getAttach(int medtitaionNo);
	
	//첨부파일 단건조회
	public MeditAttachVO attachRead(String uuid);
	
	//좋아요 숫자+1
	public int updateLike(MeditationVO vo);
	//좋아요 숫자-1
	public int updateNotLike(MeditationVO vo);
	//랜덤 명상 리스트
	public List<MeditationVO> randomMeditList();
}
