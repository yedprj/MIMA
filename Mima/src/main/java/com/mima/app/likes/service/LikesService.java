package com.mima.app.likes.service;

import com.mima.app.likes.domain.LikesVO;

public interface LikesService {
	
	public int postLikeinsert(LikesVO vo);
	
	public LikesVO postLikesRead(LikesVO vo);
	
	public int postLikedelete(LikesVO vo);

}
