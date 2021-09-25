package com.mima.app.meditation.service;


import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mima.app.criteria.domain.Criteria;
import com.mima.app.criteria.domain.ReplyPageVO;
import com.mima.app.criteria.domain.ReplyVO;
import com.mima.app.meditation.mapper.MeditationMapper;
import com.mima.app.meditation.mapper.ReplyMapper;

import lombok.extern.java.Log;

@Log
@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired ReplyMapper replyMapper;
	@Autowired MeditationMapper meditationMapper;
	
	@Override
	public int insert(ReplyVO vo) {
		meditationMapper.updateReplycnt(vo.getCmainNo(), 1);
		return replyMapper.insert(vo);
	}

	@Override
	public int delete(ReplyVO vo) {
		vo = replyMapper.read(vo);
		meditationMapper.updateReplycnt(vo.getCmainNo(), -1);
		return replyMapper.delete(vo);
	}

	@Override
	public int update(ReplyVO vo) {
		return replyMapper.update(vo);
	}

	@Override
	public ReplyPageVO getList(@Param("cri") Criteria cri, @Param("meditationNo") int meditationNo) {
		ReplyPageVO vo = new ReplyPageVO();
		log.info("================="+cri.getPageNum());
		vo.setReplyCnt(replyMapper.getCountByMeditNo(meditationNo));
		vo.setList(replyMapper.getList(cri, meditationNo));
		log.info(vo.toString()+"=======================getList ReplyServiceImpl");
		return vo;
	}

	@Override
	public ReplyVO read(ReplyVO vo) {
		return replyMapper.read(vo);
	}

}
