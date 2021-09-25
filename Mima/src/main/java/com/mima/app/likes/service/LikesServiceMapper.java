package com.mima.app.likes.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mima.app.likes.domain.LikesVO;
import com.mima.app.likes.mapper.LikesMapper;

@Service
public class LikesServiceMapper implements LikesService {

	@Autowired LikesMapper likesMapper;
	
	@Override
	public int postLikeinsert(LikesVO vo) {
		// TODO Auto-generated method stub
		return likesMapper.postLikeinsert(vo);
	}

	@Override
	public LikesVO postLikesRead(LikesVO vo) {
		// TODO Auto-generated method stub
		return likesMapper.postLikesRead(vo);
	}

	@Override
	public int postLikedelete(LikesVO vo) {
		// TODO Auto-generated method stub
		return likesMapper.postLikedelete(vo);
	}

}
