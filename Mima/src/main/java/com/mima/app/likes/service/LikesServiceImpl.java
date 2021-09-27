package com.mima.app.likes.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mima.app.likes.domain.LikesVO;
import com.mima.app.likes.mapper.LikesMapper;

@Service
public class LikesServiceImpl implements LikesService {

	@Autowired LikesMapper likesMapper;
	
	// post 좋아요 기록 추가
	@Override
	public int postLikeinsert(LikesVO vo) {
		return likesMapper.postLikeinsert(vo);
	}

	// post 좋아요 기록 확인
	@Override
	public LikesVO postLikesRead(LikesVO vo) {
		return likesMapper.postLikesRead(vo);
	}

	// post 좋아요 기록 삭제
	@Override
	public int postLikedelete(LikesVO vo) {
		return likesMapper.postLikedelete(vo);
	}

	//공용으로 사용
	@Override
	public int likeInsert(LikesVO vo) {
		return likesMapper.likeInsert(vo);
	}

	@Override
	public int likeDelete(LikesVO vo) {
		return likesMapper.likeDelete(vo);
	}


}
