package com.mima.app.comments.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mima.app.comments.domain.CommentsPageVO;
import com.mima.app.comments.domain.CommentsVO;
import com.mima.app.comments.mapper.CommentsMapper;
import com.mima.app.criteria.domain.Criteria;
import com.mima.app.meditation.mapper.MeditationMapper;

import lombok.extern.java.Log;

@Log
@Service
public class CommentsServiceImpl implements CommentsService {

	@Autowired CommentsMapper commentsMapper;
	@Autowired MeditationMapper meditationMapper;
	
	@Override
	public int insert(CommentsVO vo) {
		log.info(vo.toString()+"~~~~~~~~~~~코멘트 보입니더 코멘트서비스임플");
		meditationMapper.updateCommentsCnt(vo.getCmainCategory(), vo.getCmainNo(), 1);
		return commentsMapper.insert(vo);
	}

	@Override
	public int delete(CommentsVO vo) {
		vo = commentsMapper.read(vo);
		meditationMapper.updateCommentsCnt(vo.getCmainCategory(), vo.getCmainNo(), -1);
		return commentsMapper.delete(vo);
	}

	@Override
	public int update(CommentsVO vo) {
		return commentsMapper.update(vo);
	}

	@Override
	public CommentsPageVO getList(@Param("cri") Criteria cri, @Param("cmainCategory") String cmainCategory, @Param("cmainNo") int cmainNo) {
		CommentsPageVO pageVo = new CommentsPageVO();
		CommentsVO vo = new CommentsVO();
		vo.setCmainCategory(cmainCategory);
		vo.setCmainNo(cmainNo);
		
		log.info("================="+cri.getPageNum());
		pageVo.setReplyCnt(commentsMapper.getCountByMeditNo(vo));
		pageVo.setList(commentsMapper.getList(cri, cmainCategory, cmainNo));
		log.info(vo.toString()+"~~~~~~~~~~~~~~~~~~~~코멘트vo");
		log.info(pageVo.toString()+"====페이지보========getList CommentsServiceImpl");
		return pageVo;
	}

	@Override
	public CommentsVO read(CommentsVO vo) {
		return commentsMapper.read(vo);
	}

	// 닥터 대쉬보드 나의 후기
	@Override
	public List<CommentsVO> getlatestreviewList() {
		return commentsMapper.getlatestreviewList();
	}
}
