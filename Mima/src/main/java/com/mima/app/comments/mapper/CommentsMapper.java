package com.mima.app.comments.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mima.app.comments.domain.CommentsVO;
import com.mima.app.criteria.domain.Criteria;
import com.mima.app.session.domain.BookingVO;

public interface CommentsMapper {
	//CURD
	public int insert(CommentsVO vo);
	public int delete(CommentsVO vo);
	public int update(CommentsVO vo);
	public CommentsVO read(CommentsVO vo);
	//게시글번호에 해당하는 댓글 조회
	public  List<CommentsVO> getList(@Param("cri") Criteria cri,@Param("cmainCategory") String cmainCategory, @Param("cmainNo") int cmainNo);


	//해당 게시글의 댓글 수
	public int getCountByMeditNo(CommentsVO vo);
	
	// 닥터 대쉬보드 메인 페이지 나의 후기_J
	public List<CommentsVO> getlatestreviewList(int memberNo);
	
	// 닥터 대쉬보드 메인 페이지 나의 후기_J29
	public List<CommentsVO> docReview(int memberNo);
	
	// 닥터 대쉬보드 메인 페이지 나의 후기 카운트_J07
	public int countDocReview(int memberNo);
}
