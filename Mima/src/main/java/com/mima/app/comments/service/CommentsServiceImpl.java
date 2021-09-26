package com.mima.app.comments.service;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mima.app.comments.domain.CommentsVO;
import com.mima.app.comments.mapper.CommentsMapper;
import com.mima.app.criteria.domain.Criteria;
import com.mima.app.criteria.domain.ReplyPageVO;
import com.mima.app.meditation.mapper.MeditationMapper;

import lombok.extern.java.Log;

@Log
@Service
public class CommentsServiceImpl implements CommentsService {

	@Autowired CommentsMapper commentsMapper;
	@Autowired MeditationMapper meditationMapper;
	
	@Override
	public int insert(CommentsVO vo) {
		meditationMapper.updateReplycnt(vo.getCmainNo(), 1);
		return commentsMapper.insert(vo);
	}

	@Override
	public int delete(CommentsVO vo) {
		vo = commentsMapper.read(vo);
		meditationMapper.updateReplycnt(vo.getCmainNo(), -1);
		return commentsMapper.delete(vo);
	}

	@Override
	public int update(CommentsVO vo) {
		return commentsMapper.update(vo);
	}

	@Override
	public ReplyPageVO getList(@Param("cri") Criteria cri, @Param("meditationNo") int meditationNo) {
		ReplyPageVO vo = new ReplyPageVO();
		log.info("================="+cri.getPageNum());
		vo.setReplyCnt(commentsMapper.getCountByMeditNo(meditationNo));
		vo.setList(commentsMapper.getList(cri, meditationNo));
		log.info(vo.toString()+"=======================getList ReplyServiceImpl");
		return vo;
	}

	@Override
	public CommentsVO read(CommentsVO vo) {
		return commentsMapper.read(vo);
	}
}
