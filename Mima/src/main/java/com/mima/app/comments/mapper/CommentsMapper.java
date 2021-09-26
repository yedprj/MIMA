package com.mima.app.comments.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mima.app.comments.domain.CommentsVO;
import com.mima.app.criteria.domain.Criteria;

public interface CommentsMapper {
	//CURD
	public int insert(CommentsVO vo);
	public int delete(CommentsVO vo);
	public int update(CommentsVO vo);
	public CommentsVO read(CommentsVO vo);
	//게시글번호에 해당하는 댓글 조회
	public  List<CommentsVO> getList(@Param("cri") Criteria cri, @Param("vo") CommentsVO vo);


//해당 게시글의 댓글 수
	public int getCountByMeditNo(int meditationNo);
}
