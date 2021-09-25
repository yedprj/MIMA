package com.mima.app.likes.mapper;

import com.mima.app.likes.domain.LikesVO;

public interface LikesMapper {
	
	public int postLikeinsert(LikesVO vo);
	
	public LikesVO postLikesRead(LikesVO vo);
	
	public int postLikedelete(LikesVO vo);

}
