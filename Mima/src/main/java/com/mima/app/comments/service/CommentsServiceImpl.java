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
				
		
		pageVo.setReplyCnt(commentsMapper.getCountByMeditNo(vo));
		pageVo.setList(commentsMapper.getList(cri, cmainCategory, cmainNo));
		log.info(vo.toString()+"~~~~~~~~~~~~~~~~~~~~코멘트vo");
		log.info("====페이지보========getList CommentsServiceImpl"+pageVo.toString());
		return pageVo;
	}

	@Override
	public CommentsVO read(CommentsVO vo) {
		return commentsMapper.read(vo);
	}

	// 닥터 대쉬보드 메인 페이지 나의 후기_J
	@Override
	public List<CommentsVO> getlatestreviewList(int memberNo) {
		return commentsMapper.getlatestreviewList(memberNo);
	}

	// 닥터 대쉬보드 나의 후기 페이지_J29
	@Override
	public List<CommentsVO> docReview(int memberNo) {
		return commentsMapper.docReview(memberNo);
	}

	// 닥터 대쉬보드 메인 페이지 나의 후기 카운트_J07
	@Override
	public int countDocReview(int memberNo) {
		return commentsMapper.countDocReview(memberNo);
	}

	@Override
	public String getNickname(CommentsVO vo) {
		return commentsMapper.getNickname(vo);
	}

	// 닥터 대쉬보드 나의 후기 페이지 최신순 페이징_J13
	@Override
	public List<CommentsVO> docReviewPage(Criteria cri, int memberNo) {
		return commentsMapper.docReviewPage(cri, memberNo);
	}

	// 닥터 대쉬보드 나의 후기 페이지 페이징 카운트_J13
	@Override
	public int docReviewCount(Criteria cri, int memberNo) {
		return commentsMapper.docReviewCount(cri, memberNo);
	}

	// 닥터 대쉬보드 나의 후기 페이지 오래된순 페이징_J13
	@Override
	public List<CommentsVO> docReviewPageOldest(Criteria cri, int memberNo) {
		return commentsMapper.docReviewPageOldest(cri, memberNo);
	}
	
}
