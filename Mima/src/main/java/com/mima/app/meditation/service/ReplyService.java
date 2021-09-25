package com.mima.app.meditation.service;

import org.apache.ibatis.annotations.Param;

import com.mima.app.criteria.domain.Criteria;
import com.mima.app.criteria.domain.ReplyPageVO;
import com.mima.app.criteria.domain.ReplyVO;


public interface ReplyService {
	//CURD
	public int insert(ReplyVO vo);
	public int delete(ReplyVO vo);
	public int update(ReplyVO vo);
	public ReplyVO read(ReplyVO vo);
	//게시글번호에 해당하는 댓글 조회
	public ReplyPageVO getList(@Param("cri") Criteria cri, @Param("meditationNo") int meditationNo);

}
