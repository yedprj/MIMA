package com.mima.app.comments.service;

import org.apache.ibatis.annotations.Param;

import com.mima.app.comments.domain.CommentsPageVO;
import com.mima.app.comments.domain.CommentsVO;
import com.mima.app.criteria.domain.Criteria;

public interface CommentsService {
	//CURD
		public int insert(CommentsVO vo);
		public int delete(CommentsVO vo);
		public int update(CommentsVO vo);
		public CommentsVO read(CommentsVO vo);
		
		//게시글번호에 해당하는 댓글 조회
		public CommentsPageVO getList(@Param("cri") Criteria cri,  @Param("cmainCategory") String cmainCategory, @Param("cmainNo") int cmainNo);

}
