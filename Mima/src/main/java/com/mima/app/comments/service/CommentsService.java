package com.mima.app.comments.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mima.app.comments.domain.CommentsPageVO;
import com.mima.app.comments.domain.CommentsVO;
import com.mima.app.criteria.domain.Criteria;
import com.mima.app.session.domain.BookingVO;

public interface CommentsService {
	//CURD
		public int insert(CommentsVO vo);
		public int delete(CommentsVO vo);
		public int update(CommentsVO vo);
		public CommentsVO read(CommentsVO vo);
		
		//게시글번호에 해당하는 댓글 조회
		public CommentsPageVO getList(@Param("cri") Criteria cri,  @Param("cmainCategory") String cmainCategory, @Param("cmainNo") int cmainNo);

		// 닥터 대쉬보드 메인 페이지 나의 후기_J
		public List<CommentsVO> getlatestreviewList();
		
		// 닥터 대쉬보드 메인 페이지 나의 후기_J29
		public List<CommentsVO> docReview();
}
