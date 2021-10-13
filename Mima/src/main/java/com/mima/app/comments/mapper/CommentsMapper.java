package com.mima.app.comments.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mima.app.comments.domain.CommentsVO;
import com.mima.app.criteria.domain.Criteria;
import com.mima.app.member.domain.PatientsVO;
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
	
	//s:1013 게시글 댓글 닉네임 가져오기
	public String getNickname(CommentsVO vo);

	// 닥터 대쉬보드 나의 후기 페이지 최신순 페이징_J13
	public List<CommentsVO> docReviewPage(@Param("cri") Criteria cri, @Param("memberNo") int memberNo);
	
	// 닥터 대쉬보드 나의 후기 페이지 오래된순 페이징_J13
	public List<CommentsVO> docReviewPageOldest(@Param("cri") Criteria cri, @Param("memberNo") int memberNo);
	
	// 닥터 대쉬보드 나의 후기 페이지 페이징_J13
	public int docReviewCount(@Param("cri") Criteria cri, @Param("memberNo") int memberNo);

}
