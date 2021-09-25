package com.mima.app.comments.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mima.app.criteria.domain.Criteria;
import com.mima.app.criteria.domain.ReplyVO;

public interface CommentsMapper {
	//CURD
	public int insert(ReplyVO vo);
	public int delete(ReplyVO vo);
	public int update(ReplyVO vo);
	public ReplyVO read(ReplyVO vo);
	//게시글번호에 해당하는 댓글 조회
	public  List<ReplyVO> getList(@Param("cri") Criteria cri, @Param("meditationNo") int meditationNo);


//해당 게시글의 댓글 수
	public int getCountByMeditNo(int meditationNo);
}
